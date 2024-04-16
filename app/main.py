from .weaviateHandler import WeaviateClient, Class_names
from .middleware import LoggingMiddleware
from .database_pg import PgPool
from .app_instance import app
from .conf import conf
import signal
import sys

def handler(signum, frame):
    print('Signal handler called with signal', signum)
    sys.exit(0)

signal.signal(signal.SIGINT, handler)

app.add_middleware(LoggingMiddleware)

@app.on_event("shutdown")
async def shutdown_event():
    print("SHUTING DOWN")
    await app.state.db.disconnect()
    print("DONE SHUTING DOWN")

@app.on_event("startup")
async def startup_event():

    pg_pool = PgPool(conf['postgres'])
    await pg_pool.connect()
    app.state.db = pg_pool
