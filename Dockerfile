# Base image
FROM alpine:latest as base
LABEL maintainer=krusts31
RUN apk update && apk upgrade
RUN apk add python3 py3-pip --no-cache && ln -sf python3 /usr/bin/python
RUN pip install --no-cache --upgrade pip setuptools
RUN apk add --no-cache gcc musl-dev linux-headers python3-dev libffi-dev
WORKDIR /var/www/backend
COPY ./requirements.txt ./requirements.txt
RUN pip install --no-cache-dir --upgrade -r ./requirements.txt

# Development image
FROM base as dev
COPY ./app ./app
COPY ./weaviate_data ./weaviate_data
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "9001", "--reload"]

# Testing image
FROM base as test
COPY ./requirements-test.txt ./requirements-test.txt
RUN pip install --no-cache-dir --upgrade -r ./requirements-test.txt
COPY ./app ./app
COPY ./weaviate_data ./weaviate_data
CMD ["pytest", "./app"]

# Production image
FROM base as prod
COPY ./app ./app
COPY ./weaviate_data ./weaviate_data
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "9001"]