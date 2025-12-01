from flask import Flask
app = Flask(__name__)

@app.get("/")
def home():
    return {"message": "hello kubernetes"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
