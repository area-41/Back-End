#!pip install pyngrok
import os

from flask import Flask
from pyngrok import ngrok

app = Flask(__name__)

ngrok_token = os.getenv('NGrokUTFPR')
ngrok.set_auth_token(ngrok_token)
public_url = ngrok.connect('5000').public_url
print(f' * ngrok tunnel {public_url}')

@app.route("/")
def home():
  return "Hello"

app.run()