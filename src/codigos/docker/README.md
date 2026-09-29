

**Simular o comportamento exato** de como o Elastic Beanstalk roda uma aplicação Flask em uma instância EC2 usando containers no **GitHub Actions** ou **Docker**.

O Elastic Beanstalk com Python/Flask funciona da seguinte forma internamente:

1. Recebe o arquivo `.zip`.
2. Extrai o pacote de código.
3. Instala as dependências via `requirements.txt`.
4. Sobe um servidor WSGI (geralmente **Gunicorn**) apontando para a variável/módulo `application`.
5. Coloca um proxy **Nginx** na frente escutando a porta 80 e redirecionando para a aplicação.

---

### Simulação Local / CI via Docker (A mais fiel ao Beanstalk)

Criar um container que replica exatamente a pilha (Nginx + Gunicorn + Flask) e recebe o `app.zip` com Flask.

#### 1. Estrutura do Projeto

```text
.
├── app.zip                 # Seu pacote compactado do Flask
│   ├── application.py
│   └── requirements.txt
├── Dockerfile
└── nginx.conf

```

#### 2. `nginx.conf` (Proxy Reverso do Beanstalk)

```nginx
server {
    listen 80;
    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}

```

#### 3. `Dockerfile` (Simulador de Ambiente EC2/Beanstalk)

```dockerfile
FROM python:3.10-slim

# Instala dependências do sistema e Nginx
RUN apt-get update && apt-get install -y nginx unzip && rm -rf /var/lib/apt/lists/*

WORKDIR /var/app/current

# Copia e descompacta o app.zip (igual o Beanstalk faz na EC2)
COPY app.zip /var/app/current/
RUN unzip app.zip && rm app.zip

# Instala dependências do Flask e o servidor Gunicorn
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# Configura o Nginx
COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE 80

# Inicia o Gunicorn em segundo plano e o Nginx em primeiro plano
CMD gunicorn --bind 127.0.0.1:5000 application:application & nginx -g "daemon off;"

```

---

### Simulação de Pipeline de Teste no GitHub Actions

Para testar no GitHub via **GitHub Actions** se o `app.zip` está no formato correto exigido pelo Elastic Beanstalk antes de fazer um deploy real:

Criar o arquivo `.github/workflows/simulate_beanstalk.yml`:

```yaml
name: Simular Deploy Elastic Beanstalk

on:
  push:
    branches: [ "main" ]

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout do Código
        uses: actions/checkout@v4

      - name: Configurar Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.10'

      - name: Criar o artefato app.zip
        run: |
          zip -r app.zip . -x "*.git*"

      - name: Simular Deploy no Runner do GitHub
        run: |
          mkdir -p /tmp/beanstalk_deploy
          unzip app.zip -d /tmp/beanstalk_deploy
          cd /tmp/beanstalk_deploy
          pip install -r requirements.txt
          pip install gunicorn
          # Sobe o Gunicorn em background na porta 5000
          gunicorn --bind 127.0.0.1:5000 application:application &
          sleep 3
          # Testa se o aplicativo está respondendo
          curl http://127.0.0.1:5000

```

---

### Dicas Importantes para o Elastic Beanstalk (Python/Flask)

* **Ponto de entrada:** O Elastic Beanstalk procura por padrão um arquivo chamado `application.py` e um objeto chamado `application` (ex: `application = Flask(__name__)`).


* **requirements.txt:** Deve estar na raiz do `.zip` para que o ambiente instale as bibliotecas automaticamente.