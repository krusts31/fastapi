#!/bin/sh

CONTAINER_NAME=$(docker ps -aqf "name=full-stack-2-postgres")

docker exec $CONTAINER_NAME psql -f /tmp/dump.sql -U dev-user -h localhost -p 5432 postgres
#docker exec $CONTAINER_NAME psql -U dev-user -h localhost -p 5432 postgres <  postgres/sql_dump/dump.sql
