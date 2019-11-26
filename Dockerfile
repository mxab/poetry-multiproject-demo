FROM python:3.7

RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | POETRY_PREVIEW=1 python

ENV PATH "/root/.poetry/bin:$PATH"

COPY cli cli
COPY corelib corelib
COPY util util
COPY server server

RUN cd server && poetry install --no-dev -n