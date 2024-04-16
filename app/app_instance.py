from fastapi.middleware.cors import CORSMiddleware
from .middleware import LoggingMiddleware
from fastapi import FastAPI
from .routes import Routes
from .conf import conf

app = FastAPI()


app.add_middleware(
    CORSMiddleware,
    allow_origins=conf["whitelist"], # Allows origins from whitelist
    allow_credentials=True,
    allow_methods=["*"], # Allows all methods
    allow_headers=["*"], # Allows all headers
)
# healtcheck
app.get("/api/status")(Routes.status)
app.get("/api/db_status")(Routes.db_status)
#app.get("/api/auth0_status")(Routes.auth0_status) casdoor status
app.get("/api/stripe_status")(Routes.stripe_status)

# general api calls
app.post("/api/generate")(Routes.generate)

# stripe api calls
app.post("/api/unvolt_stripe_webhook")(Routes.web_hook)

# DB api calls
#app.get("/api/get_all_purchaes")(Routes.get_all_purchases)
#app.post("/api/save_purchase")(Routes.save_purchase)
#app.post("/api/save_form")(Routes.save_form)
app.get("/api/get_all_forms")(Routes.get_all_forms)
app.post("/api/save_form_data")(Routes.save_form_data)
app.post("/api/buy_cart")(Routes.buy_cart)

app.get("/api/get_credits")(Routes.get_credits)
