CREATE TABLE IF NOT EXISTS tb_ocupacao (
    id SERIAL PRIMARY KEY,
    codigo INT,
    titulo TEXT
);

SET client_encoding = 'LATIN1';

COPY tb_ocupacao (codigo, titulo)
FROM '/csv_data/CBO2002-Ocupacao.csv'
DELIMITER ';'
CSV HEADER