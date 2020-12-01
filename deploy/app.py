import flask
from flask import Flask

app = flask.Flask(__name__)

@app.route('/')
def home():
    return '<h1>Hello there!</h1><p>This web-page is deployed in Kubernetes on GKE. Please refer to https://github.com/janpreet/K8s-GKE/ for more information</p>'