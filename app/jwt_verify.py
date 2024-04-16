import os
import jwt

class VerifyToken():
    """Does all the token verification using PyJWT"""

    def __init__(self, token, permissions=None, scopes=None, config=None):
        self.token = token
        self.permissions = permissions
        self.scopes = scopes

        print("CONFIG:", config)
        if config == None:
            print("WRONG CONFIG")
            raise Exception("wrong config")
            self.config = {
                "domain": os.getenv("DOMAIN", "your.domain.com"),
                "api_audience": os.getenv("API_AUDIENCE", "your.audience.com"),
                "issuer": os.getenv("ISSUER", "https://your.domain.com/"),
                "algorithms": os.getenv("ALGORITHMS", "RS256"),
            }
        else:
            self.config = config

        # This gets the JWKS from a given URL and does processing so you can
        # use any of the keys available
        jwks_url = f'https://{self.config["domain"]}/.well-known/jwks.json'
        print("jwks_url:", jwks_url)
        self.jwks_client = jwt.PyJWKClient(jwks_url)
        print("client", self.jwks_client)

    def verify(self):
        # This gets the 'kid' from the passed token
        try:
            self.signing_key = self.jwks_client.get_signing_key_from_jwt(
                self.token
            ).key
        except jwt.exceptions.PyJWKClientError as error:
            print("jwt client error:", error)
            return {"status": "error", "msg": error.__str__()}
        except jwt.exceptions.DecodeError as error:
            return {"status": "error", "msg": error.__str__()}
        except Exception as e:
            return {"status": "error", "msg": e.__str__()}

        try: 
            payload = jwt.decode(
                self.token,
                self.signing_key,
                algorithms=self.config["algorithms"],
                audience=self.config["api_audience"],
                issuer=self.config["issuer"],
                leeway=120,
            )
        except Exception as e:
            return {"status": "error", "message": str(e)}

        if self.scopes:
            result = self._check_claims(payload, 'scope', str, self.scopes.split(' '))
            if result.get("error"):
                return result

        if self.permissions:
            result = self._check_claims(payload, 'permissions', list, self.permissions)
            if result.get("error"):
                return result

        return payload

    def _check_claims(self, payload, claim_name, claim_type, expected_value):

        instance_check = isinstance(payload[claim_name], claim_type)
        result = {"status": "success", "status_code": 200}

        payload_claim = payload[claim_name]

        if claim_name not in payload or not instance_check:
            result["status"] = "error"
            result["status_code"] = 400

            result["code"] = f"missing_{claim_name}"
            result["msg"] = f"No claim '{claim_name}' found in token."
            return result

        if claim_name == 'scope':
            payload_claim = payload[claim_name].split(' ')

        for value in expected_value:
            if value not in payload_claim:
                result["status"] = "error"
                result["status_code"] = 403

                result["code"] = f"insufficient_{claim_name}"
                result["msg"] = (f"Insufficient {claim_name} ({value}). You "
                                  "don't have access to this resource")
                return result
        return result
