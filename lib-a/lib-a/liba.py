import requests

def a(name):
  r = requests.get('https://api.github.com/users/'+name+'/events')
  return r.json

