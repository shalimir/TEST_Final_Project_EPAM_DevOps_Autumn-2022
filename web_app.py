from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return "This is main page version 6"

@app.route('/about')
def about():
    return "About page"

@app.route('/user')
def user():
    return "User page"

if __name__ == "__main__":
    app.run(host="0.0.0.0")
