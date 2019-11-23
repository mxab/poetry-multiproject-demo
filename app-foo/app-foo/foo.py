from liba import a

from flask import Flask, escape, request

app = Flask(__name__)

@app.route('/')
def hello():
  name = request.args.get("name", "mxab")
  return a(name);
