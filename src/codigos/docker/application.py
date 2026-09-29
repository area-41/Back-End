from flask import Flask

application = Flask(__name__)  # O Beanstalk busca a variável 'application'


@application.route("/")
def home():
    return {"status": "ok", "message": "App rodando no simulador Beanstalk!"}


if __name__ == "__main__":
    application.run(host="0.0.0.0", port=5000)