from flask import Flask, jsonify, request

app = Flask(__name__)


@app.route('/product')
def product():
    """Rota de produto com validação de parâmetro obrigatório."""
    product_id = request.args.get('id')
    if not product_id:
        return jsonify({'error': 'Parâmetro id é obrigatório'}), 400
    return f"Product Page for Product ID: {product_id}"


@app.route('/comments')
def comments():
    """Rota de comentários que retorna os parâmetros formatados em JSON."""
    return jsonify(dict(request.args))


@app.route('/order', methods=['GET'])
def orders():
    """Rota de pedidos com valor padrão para status."""
    status = request.args.get('status', 'pendente')
    return f"O pedido saiu {status}"

# Error Handler para 404
@app.errorhandler(404)
def not_found_error(error):
    return jsonify({'error': 'Recurso não encontrado'}), 404

# Error Handler para 405
@app.errorhandler(405)
def method_not_allowed_error(error):
    return jsonify({'error': 'Método HTTP não permitido para esta rota'}), 405


if __name__ == '__main__':
    app.run(debug=True, port=3000, host='0.0.0.0')