from flask import Flask
from flask_cors import CORS


app = Flask(__name__)
CORS(app)


@app.route('/')
def index():
    return { 'message': 'Hello, World!' }


# if __name__ == "__main__":
#   app.run(debug=True, port=3000, host='0.0.0.0')
