from flask import Flask
from flask_caching import Cache

app = Flask(__name__)
cache = Cache(app, config={'CACHE_TYPE': 'SimpleCache', 'CACHE_DEFAULT_TIMEOUT': 60})

@app.route('/dados-pesados')
@cache.cached(timeout=120)  # Guarda o retorno desta rota por 2 minutos
def get_heavy_data():
    # Consulta demorada ao banco de dados...
    return {'data': 'resultado_processado'}