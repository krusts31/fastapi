from fastapi import Depends, Response, status, Request, HTTPException, Header
from pydantic import BaseModel
from fastapi.responses import RedirectResponse, HTMLResponse
from fastapi.security import HTTPBearer
from .jwt_verify import VerifyToken
from .models import QuestionPage, QuestionPages, ProductList, pageId
from functools import wraps
from .stripe import stripe
from .conf import conf
from loguru import logger
import requests
import json

token_auth_scheme = HTTPBearer()

def verify_token_decorator(f):
    @wraps(f)
    async def decorated_function(*args, **kwargs):
        request = args[0] if args else kwargs.get('request')
        token = kwargs.get('token')

        if isinstance(request, Request):
            result = VerifyToken(token.credentials, config=conf["auth0"]).verify()
            if "status" in result and result["status"] == "error":
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=result,
                )
            user_id = result.get('sub')
            kwargs['user_id'] = user_id

        return await f(*args, **kwargs)
    return decorated_function

class Routes():

    def status(request: Request):
        return {"status": "200"}

    async def db_status(request: Request):
        try:
            status = await request.app.state.db.test_query()
            return {"status": "200"}
        except Exception as e:
            return {"status": "500"}

#    @verify_token_decorator
#    async def auth0_status(request: Request, response: Response, token: str = Depends(token_auth_scheme)):
#        return {"status": "200"}

    async def stripe_status(request: Request, response: Response, token: str = Depends(token_auth_scheme)):
        try:
            products = stripe.Product.list(limit=1)
            return {"status": "200"}
        except Exception as e:
            return {"status": "500"}

# ========================== Stripe
    @verify_token_decorator
    async def buy_cart(request: Request, product_list_ids: ProductList, token: str = Depends(token_auth_scheme), user_id: str = None):
        try:
            print("quantity:", product_list_ids.product_list_ids, user_id, flush=True)
            domain_url = conf["whitelist"][0]
            checkout_session = stripe.checkout.Session.create(
              line_items=[
                  {
                      'price': conf["stripe"]["product_price"],
                      'quantity': str(len(product_list_ids.product_list_ids)),
                  },
              ],
              mode='payment',
              success_url=domain_url + "/successfulpayment",
              cancel_url=domain_url + "/canceledpayment",
              metadata={
                "auth0_id": str(user_id),
                "product_ids": str(product_list_ids.product_list_ids),
              }
            )
            return (checkout_session.url)
        except Exception as e:
            raise HTTPException(403, str(e))

    async def web_hook(request: Request, stripe_signature: str = Header(None)):
        event = None
        data = await request.body()
        try:
            event = stripe.Webhook.construct_event(
                payload=data,
                sig_header=stripe_signature,
                secret=conf["stripe"]["endpoint_secret"]
            )
        except ValueError as e:
            # Invalid payload
            raise e
        except stripe.error.SignatureVerificationError as e:
            # Invalid signature
            raise e
        except Exception as e:
            print(e)
            return {"error": str(e)}
        event_data = event['data']
        event_type = event['type']
        if event_type == 'checkout.session.completed':
            metadata = event_data.get('object', {}).get('metadata', {})
            auth0_id = metadata["auth0_id"]
            product_ids = json.loads(metadata["product_ids"])
            #this is supper error prone what if DB errors and client pays!?
            for product_id in product_ids:
                try:
                    query = await request.app.state.db.change_form_status_to_paid(auth0_id, product_id);
                except Exception as e:
                    print(e, flush=True)
            print('checkout session completed')
        elif event_type == 'invoice.paid':
            print('invoice paid')
        elif event_type == 'invoice.payment_failed':
            print('invoice payment failed')
        else:
            print(f'unhandled event: {event_type}')

        return {"status": 200}

# ========================= DB

    @verify_token_decorator
    async def save_form_data(request: Request, payload: QuestionPages, response: Response, token: str = Depends(token_auth_scheme), user_id: str = None):
        try:
            query = await request.app.state.db.create_new_form(user_id, payload.pages, "done", payload.secret_code);
            return {"result": query}
        except Exception as e:
            print(e, flush=True)
            return {"status": "500"}

    @verify_token_decorator
    async def get_all_forms(request: Request, response: Response, token: str = Depends(token_auth_scheme), user_id: str = None):
        try:
            query = await request.app.state.db.get_all_forms(user_id);
            return {"data": query}
        except Exception as e:
            logger.error(f"Error in genereate route {e}")
            raise HTTPException(500, str(e))

    @verify_token_decorator
    async def get_credits(request: Request, response: Response, token: str = Depends(token_auth_scheme), user_id: str = None):
        try:
            credits = await request.app.state.db.get_credits_left(user_id);
            return credits
        except Exception as e:
            logger.error(f"Error in genereate route {e}")
            raise HTTPException(500, str(e))


    # ========================== Generate
    @verify_token_decorator
    async def generate(request: Request, pages: pageId, token: str = Depends(token_auth_scheme), user_id: str = None):
        transaction_type = "generated"
        credits_left = await request.app.state.db.get_credits_left(user_id)
        form = None
        if credits_left["credits_left"] > 0:
            transaction_type = "used_credits"
            form = await request.app.state.db.get_form(user_id, pages.id)
        else:
            form = await request.app.state.db.get_paid_form(user_id, pages.id)

        if form == None:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="wrong data",
            )
        data_dict = form['data']
        data_dict = [QuestionPage.parse_obj(page) for page in data_dict]

        # parse the question pages for Zap
        max_index = 0
        for page in data_dict:
            for q in page.questions:
                if q.index > max_index:
                    max_index = q.index

        answs = {}
        email = ""
        for page in data_dict:
            for q in page.questions:
                templateObj = request.app.state.weaviateClient.search(q.answer, q.key)
                if templateObj.get("data"):
                    try:
                        answer = templateObj["data"]["Get"][q.key.capitalize()][0]["answer"]#gegevens
                        gpt_example = templateObj["data"]["Get"][q.key.capitalize()][0]["gpt_example"]
                        answs[q.key+"_vector"] = "Gegevens 1:\n\n" + answer + "\n\nAntwoord 1:\n\n" + gpt_example
                        #qustion = templateObj["data"]["Get"][q.key.capitalize()][0]["question"]
                    except Exception as e:
                        print("Error:", gpt_example, answer, e, flush=True)
                        pass
                if q.key == 'send_email':
                    email = answs[q.key] = q.answer
                answs[q.key] = q.answer
        print("answs", answs, flush=True)

        try:
            zap_callback_url = conf["zapcallback"]
            r = requests.post(zap_callback_url, json={ "answers": answs })
            if r.status_code != 200:
                raise HTTPException(
                    500,
                    "failed to start generator",
                )

            print("HELLO answs", user_id, r.status_code, form['id'], pages.id, flush=True, )
            query = await request.app.state.db.change_form_status_to_generated(user_id, pages.id);
            query = await request.app.state.db.insert_transaction(user_id, transaction_type);
            return {"status": 200, "email": email, "id": pages.id}
        except Exception as e:
            logger.error(f"Error in genereate route {e}")
            raise HTTPException(
                500,
                str(e),
            )
