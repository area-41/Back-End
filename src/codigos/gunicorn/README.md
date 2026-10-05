# 1. Instalar o uv no WSL (caso ainda não tenha instalado)
curl -LsSf https://astral.sh/uv/install.sh | sh

# 2. Criar o ambiente virtual dentro do Linux
uv venv .venv-wsl

# 3. Ativar o ambiente
source .venv-wsl/bin/activate

# 4. Instalar as dependências
uv pip install flask gunicorn

Using Python 3.12.14 environment at: .venv-wsl
Resolved 8 packages in 266ms
Prepared 8 packages in 201ms
░░░░░░░░░░░░░░░░░░░░ [0/8] Installing wheels...                                                                                warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
         If the cache and target directories are on different filesystems, hardlinking may not be supported.
         If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
Installed 8 packages in 1.46s
 + blinker==1.9.0
 + click==8.5.0
 + flask==3.1.3
 + gunicorn==26.2.0
 + itsdangerous==2.2.0
 + jinja2==3.1.6
 + markupsafe==3.0.3
 + werkzeug==3.1.9

# 5. Executar o Gunicorn
Com o ambiente do WSL ativo, execute o comando apontando para o seu ficheiro app.py:
gunicorn -w 8 -b 0.0.0.0:8080 app:app