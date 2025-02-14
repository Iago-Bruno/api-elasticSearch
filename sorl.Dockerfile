# Usar a imagem oficial do Solr
FROM bitnami/solr:latest

# Copiar o script de inicialização
COPY init-config/init-solr.sh /init.sh

# Tornar o script executável
USER root
RUN chmod +x /init.sh
RUN chown 1001:1001 /init.sh
USER 1001

# Expor a porta padrão do Solr
EXPOSE 8983

# Configurar para rodar o script na inicialização do Solr
CMD ["./init.sh"]