FROM postgres:latest

# Copiar arquivo de inicialização do banco
COPY init-config/init.sql /docker-entrypoint-initdb.d/

# Expor o banco na porta
EXPOSE 5432

# Configuração do volume
VOLUME /var/lib/postgresql/data
