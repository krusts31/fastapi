from .conf import conf
import stripe

stripe.api_key = conf["stripe"]["private_key"]

stripe.api_version = '2020-08-27'
