#!/bin/bash

# Lista os nós que estão "Down"
NODES_DOWN=$(docker node ls --format '{{.ID}} {{.Status}}' | grep Down | awk '{print $1}')

# Se houver nós Down, removê-los automaticamente
if [ ! -z "$NODES_DOWN" ]; then
  for NODE in $NODES_DOWN; do
    echo "Removendo nó offline: $NODE"
    docker node rm --force $NODE
  done
else
  echo "Nenhum nó offline encontrado."
fi
