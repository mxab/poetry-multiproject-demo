
# Path dependencies

Showcase is a `server` and a `cli` application that both contain common functionalities and therefore have a shared path dependencies `corelib`. This dependencies as another path dependency `util`

# Expected/Assumed behavior for server to run

```
cd server
poetry install
poetry run env FLASK_APP=server/server.py flask run
```

# Isolated in docker

```
docker build -t demo .
```