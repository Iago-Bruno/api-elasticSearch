#!/bin/bash
set -e

core_name="ocupacoes"

# Espera o Solr iniciar
echo "Aguardando o Solr iniciar..."
solr start
sleep 5

# Verifica se o core já existe no Solr
# if curl -s "http://solr_container:8983/solr/admin/cores?action=STATUS" | grep -q "\"${core_name}\""; then
#     echo "O core '${core_name}' já existe. Pulando criaçao deste core"
# else
#     echo "Criando core '${core_name}'..."
#     solr create -c "${core_name}"
#     echo "Core '${core_name}' criado com sucesso!"
# fi
# tail -f /opt/bitnami/solr/logs/solr.log
if curl -s "http://solr:8983/solr/admin/cores?action=STATUS" | grep -q "\"${core_name}\""; then
    echo "O core '${core_name}' já existe. Pulando criaçao deste core"
else
    echo "Criando core '${core_name}'..."
    solr create -c "${core_name}"
    echo "Core '${core_name}' criado com sucesso!"
fi
tail -f /opt/bitnami/solr/logs/solr.log