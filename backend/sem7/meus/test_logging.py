import logging
# Adicione 'request' na importação do Flask
from flask import Flask, request

app = Flask(__name__)

logging.basicConfig(level=logging.INFO)

@app.route('/processar')
def processar():
    app.logger.info("Iniciando processamento da requisição...")
    try:
        return {'status': 'sucesso'}
    except Exception as e:
        app.logger.error(f"Falha ao processar: {e}")
        return {'status': 'erro'}, 500


@app.route('/processar_2', methods=['GET', 'POST'])
def processar_2():
    # Agora o 'request' estará disponível para ser acessado
    if request.method == 'POST':
        app.logger.info("Requisição POST recebida!")
        return {'message': 'Processado via POST'}, 200

    return {'message': 'Processado via GET'}, 200