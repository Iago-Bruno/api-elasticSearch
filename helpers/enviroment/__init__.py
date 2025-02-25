from dotenv import load_dotenv
import os

load_dotenv(".env")

URL_SOLR=os.getenv("URL_SOLR", "http://solr:8983/solr/ocupacoes")
URL_DB=os.getenv("URL_DB", "postgresql://postgres:12345678@database:5432/db_ocupacoes")
