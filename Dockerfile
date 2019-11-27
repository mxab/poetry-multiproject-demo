FROM python:3.7

RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | POETRY_PREVIEW=1 python
EXPOSE 5000
ENV PATH "/root/.poetry/bin:$PATH"

COPY corelib /app/corelib
COPY util /app/util
COPY server /app/server


WORKDIR /app/server
RUN poetry install -vvv --no-dev -n
CMD poetry run env FLASK_APP=server/server.py flask run

