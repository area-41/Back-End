import requests

BASE_URL = "http://localhost:3000"


def testar_com_requests():
    print("=== TESTANDO SERVIDOR EM EXECUÇÃO VIA REQUESTS ===\n")

    # 1. Teste /product com e sem parâmetro 'id'
    res_product_1 = requests.get(f"{BASE_URL}/product", params={'id': '42'})
    print(f"[GET /product?id=42] {res_product_1.status_code} -> {res_product_1.text}")

    res_product_2 = requests.get(f"{BASE_URL}/product")
    print(f"[GET /product] {res_product_2.status_code} -> {res_product_2.text}")

    # 2. Teste /comments com dicionário de parâmetros
    payload = {'post_id': '10', 'limit': '5'}
    res_comments = requests.get(f"{BASE_URL}/comments", params=payload)
    print(f"[GET /comments] {res_comments.status_code} -> {res_comments.json()}")

    # 3. Teste /order com parâmetro status
    res_order = requests.get(f"{BASE_URL}/order", params={'status': 'entregue'})
    print(f"[GET /order] {res_order.status_code} -> {res_order.text}")


if __name__ == '__main__':
    testar_com_requests()