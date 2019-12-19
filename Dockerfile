FROM python:3.6
RUN apt-get update && apt-get install curl build-essential -y
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
ENV PATH="/root/.poetry/bin:$PATH"
EXPOSE 5000

COPY app-utils/poetry.lock app-utils/pyproject.toml /app/app-utils/
COPY corelib/poetry.lock corelib/pyproject.toml /app/corelib/
COPY server/poetry.lock server/pyproject.toml /app/server/

RUN cd /app/app-utils && poetry install --no-dev -n
RUN cd /app/corelib && poetry install --no-dev -n
RUN cd /app/server && poetry install --no-dev -n

COPY app-utils/apputil /app/app-utils/apputil
COPY corelib/corelib /app/corelib/corelib
COPY server/server /app/server/server

WORKDIR /app/server
CMD poetry run env FLASK_APP=server/server.py flask run

