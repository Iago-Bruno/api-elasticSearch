# Use uma imagem Python como base
FROM python:3.9

# Definir o diretório de trabalho
WORKDIR /app

# Copiar os arquivos de dependências para o contêiner
COPY requirements.txt /app/

# Instalar as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o código da aplicação para o contêiner
COPY . /app/

# Definir a variável de ambiente para o Flask
ENV FLASK_APP=app.py

# Expor a porta onde a aplicação Flask irá rodar
EXPOSE 5000

# Rodar o servidor Flask
CMD ["gunicorn", "--workers", "3", "--bind", "0.0.0.0:5000", "wsgi:app", "--access-logfile", "-", "--error-logfile", "-"]
