from database import get_db

def init_db():
    # Obtém a conexão usando o caminho já configurado no database.py
    with get_db() as conn:
        cursor = conn.cursor()
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS users (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT NOT NULL UNIQUE,
                password TEXT NOT NULL,
                created_at TEXT NOT NULL
            )
        ''')
        conn.commit()
    print("Tabela 'users' criada com sucesso!")

if __name__ == '__main__':
    init_db()