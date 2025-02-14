from flask import Flask, jsonify, render_template, request
import pysolr
from sync_postgres_solr import dados_postgres, carregar_solr
from helpers.enviroment import URL_SOLR

app = Flask(__name__)

index_template = 'index.html'

@app.route('/sync', methods=['POST'])
def index_data():
    try:
        # criar_core_solr()  # Cria o core antes de indexar
        solr_docs = dados_postgres()
        if not solr_docs:
            return jsonify({"message": "Nenhum dado encontrado no PostgreSQL"}), 404
        
        carregar_solr(solr_docs)
        return jsonify({"message": "Dados indexados com sucesso no Solr!"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/')
def index():
    return render_template(index_template)

@app.route('/search', methods=['GET'])
def search():
    try:
        print(URL_SOLR)
        search_value = request.args.get('search')

        solr = pysolr.Solr(URL_SOLR, always_commit=True, timeout=10)

        lista = solr.search(f'titulo:{search_value}~2 OR codigo:{search_value}~2 OR id:{search_value}', rows=50)
        
        print(lista)
        return render_template(index_template, lista=lista)
    except Exception as e:
        print(f"Erro ao consultar o Solr: {e}")
        return render_template(index_template, lista=[]) 

if __name__ == '__main__':
    app.run(debug=True)





