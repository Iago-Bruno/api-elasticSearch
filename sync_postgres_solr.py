import psycopg2
import pysolr
from helpers.enviroment import URL_SOLR, URL_DB 

def get_pg_connection():
    return psycopg2.connect(URL_DB)

solr = pysolr.Solr(URL_SOLR, always_commit=True, timeout=10)

def dados_postgres():
    conn = get_pg_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT row_to_json(t) FROM (SELECT id, codigo, titulo FROM tb_ocupacao) t;")
            rows = cursor.fetchall()
        return [row[0] for row in rows]
    except Exception as e:
        print(f"Erro ao buscar dados do PostgreSQL: {e}")
        return []
    finally:
        conn.close()

def carregar_solr(docs):
    if docs:
        try:
            solr.add(docs)
            print("Dados indexados com sucesso no Solr!")
        except Exception as e:
            print(f"Erro ao indexar no Solr: {e}")

if __name__ == "__main__":
    solr_docs = dados_postgres()
    carregar_solr(solr_docs)
    print("Dados transferidos com sucesso para o Solr!")
