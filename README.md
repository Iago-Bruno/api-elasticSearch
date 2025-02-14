# API Elasticsearch

## 📌 Sobre o Projeto

Este projeto é uma API desenvolvida em Flask que integra o PostgreSQL com o Solr. A API permite processar dados de um arquivo csx, inseri-los em um banco de dados PostgreSQL e indexar no Apache bitname/Solr, podendo realizar buscas eficientes utilizando Elasticsearch.

## 🏗️ Tecnologias Utilizadas

- Python

- Flask

- PostgreSQL

- Elasticsearch / Solr

- Docker & Docker Compose

- Psycopg2 (conector PostgreSQL)

- Pysolr (conector Solr)

- Dotenv (para gerenciamento de variáveis de ambiente)

## Instalação

### 1️⃣ Pré-requisitos

Antes de iniciar, certifique-se de ter instalado:

- Docker
- Docker Compose

### 2️⃣ Clonar o Repositório

```bash
  git clone https://github.com/Iago-Bruno/api-elasticSearch.git
  cd api-elasticSearch
```

### 3️⃣ Subir os Containers Docker

```bash
  docker-compose up --build
```

### 4️⃣ Acessar a API

- [Acessar Api do navegador localmente](http://localhost:5000/search)

## EndPoints Disponíveis

| Método | Endpoint        | Descrição                                     |
| :----- | :-------------- | :-------------------------------------------- |
| `GET`  | `/search?q=xyz` | Realiza uma busca no Solr pelo termo xyz.     |
| `POST` | `/sync`         | Sincroniza os dados do PostgreSQL com o Solr. |
