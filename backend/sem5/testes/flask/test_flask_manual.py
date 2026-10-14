import json
from app import app  # Importe a instância 'app' do seu arquivo do Flask


def testar_rotas_flask():
    # Cria o cliente de testes do Flask
    client = app.test_client()

    print("=== TESTANDO ROTAS DO FLASK ===\n")

    # 1. Testes para /product
    print("--- Rota /product ---")
    # Caso 1: Passando ID via query string
    res = client.get('/product?id=123')
    print(f"[GET /product?id=123] Status: {res.status_code} | Resposta: {res.get_data(as_text=True)}")

    # Caso 2: Sem passar ID (deve usar 'unknown')
    res = client.get('/product')
    print(f"[GET /product] Status: {res.status_code} | Resposta: {res.get_data(as_text=True)}")

    print("\n--- Rota /comments ---")
    # Caso 1: Enviando múltiplos parâmetros de busca
    params = {'user': 'marcos', 'page': 2, 'sort': 'asc'}
    res = client.get('/comments', query_string=params)
    print(f"[GET /comments] Status: {res.status_code} | Resposta JSON: {res.get_data(as_text=True)}")

    # Caso 2: Sem parâmetros
    res = client.get('/comments')
    print(f"[GET /comments (vazio)] Status: {res.status_code} | Resposta JSON: {res.get_data(as_text=True)}")

    print("\n--- Rota /order ---")
    # Caso 1: Status customizado
    res = client.get('/order?status=enviado')
    print(f"[GET /order?status=enviado] Status: {res.status_code} | Resposta: {res.get_data(as_text=True)}")

    # Caso 2: Sem status (fallback para 'pendente')
    res = client.get('/order')
    print(f"[GET /order] Status: {res.status_code} | Resposta: {res.get_data(as_text=True)}")


if __name__ == '__main__':
    testar_rotas_flask()