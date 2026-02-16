from flask import Flask
import os

app = Flask(__name__)

@app.get("/")
def home():
    return "ok", 200

@app.get("/health")
def health():
    return "healthy", 200

@app.get("/version")
def version():
    return os.getenv("GIT_SHA", "dev"), 200

if __name__ == "__main__":
    port = int(os.getenv("PORT", "8080"))
    app.run(host="0.0.0.0", port=port)
