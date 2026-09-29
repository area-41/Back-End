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