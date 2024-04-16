from starlette.middleware.base import BaseHTTPMiddleware
from starlette.requests import Request
from starlette.types import ASGIApp
from loguru import logger
import sys


class LoggingMiddleware(BaseHTTPMiddleware):
    def __init__(self, app: ASGIApp) -> None:
        super().__init__(app)
        logger.remove()
        logger.add(
            sys.stdout,
            colorize=True,
            format="<green>{time:HH:mm:ss}</green> | <level>{level}</level> | <cyan>{message}</cyan>",
        )
        logger.add(
            "ERRORS.log",
            level="ERROR",
            rotation="10 MB",
            retention="10 days",
            format="<red>{time:YYYY-MM-DD HH:mm:ss}</red> | <level>{level}</level> | <cyan>{message}</cyan>",
        )  # Add this line

    async def dispatch(self, request: Request, call_next):
        logger.info(f"Incoming request {request.method} {request.url.path}")
        response = await call_next(request)
        logger.info(f"Outgoing response {response.status_code}")
        return response
