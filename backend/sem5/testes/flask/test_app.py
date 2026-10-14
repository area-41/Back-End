"""
Suíte de Testes Automatizados para a API Flask.

Estrutura dos testes baseada no padrão AAA:
  - Arrange (Preparação): Configura os dados e pré-requisitos.
  - Act (Ação): Executa a requisição na rota desejada.
  - Assert (Verificação): Valida o status HTTP, os headers e o corpo da resposta.
"""

import pytest
from app import app  # Importa a instância da aplicação Flask


@pytest.fixture
def client():
    """
    Fixture de teste do Pytest.
    
    Cria e disponibiliza um cliente de testes isolado do Flask (test_client).
    Garante que as configurações do app fiquem em modo de teste e limpa
    o contexto após a execução de cada função de teste.
    """
    app.config['TESTING'] = True
    with app.test_client() as test_client:
        yield test_client


# ==============================================================================
# SUÍTE DE TESTES: ROTA /product
# ==============================================================================

class TestProductRoute:
    """Grupo de testes para o endpoint GET /product."""

    def test_product_sucesso_com_id(self, client):
        """
        Garante que enviar um 'id' válido retorne HTTP 200 OK
        e o texto formatado corretamente.
        """
        # Arrange
        endpoint = '/product?id=123'

        # Act
        response = client.get(endpoint)

        # Assert
        assert response.status_code == 200, "O código HTTP de sucesso deve ser 200"
        assert response.get_data(as_text=True) == "Product Page for Product ID: 123"

    def test_product_erro_sem_id(self, client):
        """
        Garante que acessar a rota sem o parâmetro 'id' retorne HTTP 400 Bad Request
        e a mensagem de erro esperada em formato JSON.
        """
        # Arrange
        endpoint = '/product'

        # Act
        response = client.get(endpoint)
        json_response = response.get_json()

        # Assert
        assert response.status_code == 400, "Deve retornar erro 400 quando o ID estiver ausente"
        assert response.content_type == 'application/json', "O tipo de conteúdo deve ser JSON"
        assert json_response == {'error': 'Parâmetro id é obrigatório'}


# ==============================================================================
# SUÍTE DE TESTES: ROTA /comments
# ==============================================================================

class TestCommentsRoute:
    """Grupo de testes para o endpoint GET /comments."""

    def test_comments_com_multiplos_parametros(self, client):
        """
        Verifica se os parâmetros de busca passados via URL são convertidos
        corretamente em um objeto JSON de resposta.
        """
        # Arrange
        query_params = {'user': 'marcos', 'page': '2', 'sort': 'asc'}

        # Act
        response = client.get('/comments', query_string=query_params)

        # Assert
        assert response.status_code == 200
        assert response.content_type == 'application/json'
        assert response.get_json() == query_params

    def test_comments_sem_parametros_retorna_json_vazio(self, client):
        """
        Garante que a rota retorne um objeto JSON vazio {} com status 200
        quando nenhum parâmetro for informado.
        """
        # Act
        response = client.get('/comments')

        # Assert
        assert response.status_code == 200
        assert response.content_type == 'application/json'
        assert response.get_json() == {}


# ==============================================================================
# SUÍTE DE TESTES: ROTA /order (USANDO PARAMETRIZAÇÃO DO PYTEST)
# ==============================================================================

class TestOrderRoute:
    """Grupo de testes para o endpoint GET /order."""

    @pytest.mark.parametrize(
        "query_param, resposta_esperada",
        [
            ('?status=enviado', 'O pedido saiu enviado'),
            ('?status=entregue', 'O pedido saiu entregue'),
            ('', 'O pedido saiu pendente'),  # Teste do valor padrão (fallback)
        ],
        ids=['status_enviado', 'status_entregue', 'status_padrao_pendente']
    )
    def test_order_status_dinamico_e_padrao(self, client, query_param, resposta_esperada):
        """
        Testa múltiplos cenários da rota /order utilizando parametrização:
          1. Status customizado 'enviado'
          2. Status customizado 'entregue'
          3. Ausência de parâmetro (deve cair no default 'pendente')
        """
        # Act
        response = client.get(f'/order{query_param}')

        # Assert
        assert response.status_code == 200
        assert response.get_data(as_text=True) == resposta_esperada

# ==============================================================================
# SUÍTE DE TESTES: TRATAMENTO DE ERROS HTTP (404 e 405)
# ==============================================================================

class TestHTTPErrorHandlers:
    """Grupo de testes para validação de erros padrão do protocolo HTTP."""

    def test_rota_nao_encontrada_json_customizado(self, client):
        response = client.get('/rota_que_nao_existe')
        
        assert response.status_code == 404
        assert response.content_type == 'application/json'
        assert response.get_json() == {'error': 'Recurso não encontrado'}

    def test_metodo_nao_permitido_json_customizado(self, client):
        response = client.post('/order')
        
        assert response.status_code == 405
        assert response.content_type == 'application/json'
        assert response.get_json() == {'error': 'Método HTTP não permitido para esta rota'}