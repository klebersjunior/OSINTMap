# Use a imagem oficial do nginx como base
FROM nginx:alpine

# Remover a página padrão do nginx
RUN rm -rf /usr/share/nginx/html/*

# Copiar todos os arquivos da aplicação para o diretório do nginx
COPY . /usr/share/nginx/html/

# Copiar configuração personalizada do nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expor a porta 80
EXPOSE 80

# Comando para iniciar o nginx
CMD ["nginx", "-g", "daemon off;"] 