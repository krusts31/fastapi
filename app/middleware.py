import sys
from loguru import logger
from starlette.middleware.base import BaseHTTPMiddleware
from starlette.requests import Request
from starlette.types import ASGIApp

class LoggingMiddleware(BaseHTTPMiddleware):
    def __init__(self, app: ASGIApp) -> None:
        super().__init__(app)
        logger.remove()
        logger.add(sys.stdout, colorize=True, format="<green>{time:HH:mm:ss}</green> | <level>{level}</level> | <cyan>{message}</cyan>")

    async def dispatch(self, request: Request, call_next):
        logger.info(f"Incoming request {request.method} {request.url.path}")
        response = await call_next(request)
        logger.info(f"Outgoing response {response.status_code}")
        return response
