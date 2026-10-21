import os
from flask import Flask, request
from werkzeug.utils import secure_filename

app = Flask(__name__)

# Define o caminho absoluto da pasta uploads
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
UPLOAD_FOLDER = os.path.join(BASE_DIR, 'uploads')

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return {'error': 'Nenhum arquivo enviado'}, 400
        
    file = request.files['file']
    if file.filename == '':
        return {'error': 'Nenhum arquivo selecionado'}, 400

    filename = secure_filename(file.filename)

    # Cria a pasta 'uploads' se ela não existir
    os.makedirs(UPLOAD_FOLDER, exist_ok=True)

    # Salva o arquivo no caminho correto
    file_path = os.path.join(UPLOAD_FOLDER, filename)
    file.save(file_path)

    return {'message': 'Arquivo salvo com sucesso', 'path': file_path}, 200