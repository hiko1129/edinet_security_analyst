FROM python:3.7-alpine3.8

ARG APP_ROOT=/usr/src/edinet_security_analyst

WORKDIR $APP_ROOT

RUN apk add --no-cache gcc libc-dev libxml2-dev libxslt-dev

COPY Pipfile .
COPY Pipfile.lock .

RUN pip install pipenv
RUN pipenv install --system

COPY . .
