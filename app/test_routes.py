from fastapi.testclient import TestClient
from .app_instance import app
from .conf import conf
import http.client
import pytest
import json

client = TestClient(app)


def test_status():
  response = client.get("/api/status");
  assert response.status_code == 200
  assert response.json() == {
    "status": "200" 
  }

def test_webhook():
  response = client.get("/api/status");
  assert response.status_code == 200
  assert response.json() == {
    "status": "200" 
  }

def test_create_form():
  conn = http.client.HTTPSConnection("kexxu.eu.auth0.com")
  payload = f"""{{
    "client_id": "{conf['auth0']['client_id']}",
    "client_secret": "{conf['auth0']['client_secret']}",
    "audience": "{conf['auth0']['api_audience']}",
    "grant_type": "client_credentials"
  }}"""
  headers = { 'content-type': "application/json" }
  conn.request("POST", "/oauth/token", payload, headers)
  res = conn.getresponse()
  data = res.read()

  json_string = data.decode("utf-8")
  json_dict = json.loads(json_string)
  print(json_dict)
  access_token = json_dict["access_token"]
  headers = {"Authorization": f"Bearer {access_token}"}
  print(headers)
  response = client.post("/api/create_form", headers=headers, json={"data": "test"})
  assert response.status_code == 200
  assert response.json() == {"status": "200"}
