# 🐳 Deployment Docker - OSINTMap

Este guia explica como fazer o deployment da aplicação OSINTMap usando Docker e nginx.

## 📋 Pré-requisitos

- Docker instalado (versão 20.10+)
- Docker Compose instalado (versão 2.0+)

## 🚀 Opções de Deployment

### 1. **Usando Docker Compose (Recomendado)**

```bash
# Build e executar a aplicação
docker-compose up -d

# Verificar se está funcionando
docker-compose ps

# Parar a aplicação
docker-compose down
```

A aplicação estará disponível em: `http://localhost:8080`

### 2. **Usando Docker diretamente**

```bash
# Build da imagem
docker build -t osintmap .

# Executar o container
docker run -d \
  --name osintmap-app \
  -p 8080:80 \
  --restart unless-stopped \
  osintmap

# Verificar se está funcionando
docker ps

# Parar o container
docker stop osintmap-app
docker rm osintmap-app
```

### 3. **Build para produção**

```bash
# Build da imagem com tag de versão
docker build -t osintmap:v1.0.0 .

# Tag para registry (opcional)
docker tag osintmap:v1.0.0 seu-registry/osintmap:v1.0.0

# Push para registry (opcional)
docker push seu-registry/osintmap:v1.0.0
```

## 🔧 Configurações

### **Portas**
- **Padrão**: A aplicação roda na porta 8080 (mapeada para a porta 80 do container)
- **Personalizada**: Altere a porta no `docker-compose.yml` ou no comando docker run

```yaml
# No docker-compose.yml
ports:
  - "3000:80"  # Aplicação disponível na porta 3000
```

### **Logs**
Os logs do nginx são salvos em:
- `/var/log/nginx/access.log` (logs de acesso)
- `/var/log/nginx/error.log` (logs de erro)

Para acessar os logs:
```bash
# Logs do container
docker-compose logs -f osintmap

# Logs do nginx dentro do container
docker exec osintmap-app tail -f /var/log/nginx/access.log
```

### **Volumes**
O docker-compose.yml inclui um volume para logs:
```yaml
volumes:
  - ./logs:/var/log/nginx
```

## 🌐 Configuração para Produção

### **Proxy Reverso**
Para produção, recomenda-se usar um proxy reverso como Traefik ou nginx:

```yaml
# Exemplo com Traefik (já incluído no docker-compose.yml)
labels:
  - "traefik.enable=true"
  - "traefik.http.routers.osintmap.rule=Host(`seu-dominio.com`)"
  - "traefik.http.services.osintmap.loadbalancer.server.port=80"
```

### **HTTPS/SSL**
Configure SSL através do seu proxy reverso ou load balancer.

### **Domínio personalizado**
Altere o `server_name` no `nginx.conf` se necessário:
```nginx
server_name seu-dominio.com;
```

## 🛠️ Customização

### **Configuração do nginx**
Edite o arquivo `nginx.conf` para:
- Alterar configurações de cache
- Modificar headers de segurança
- Ajustar compressão gzip
- Adicionar autenticação básica

### **Variáveis de ambiente**
O container suporta as seguintes variáveis:
- `NGINX_HOST`: Nome do host (padrão: localhost)
- `NGINX_PORT`: Porta do nginx (padrão: 80)

## 🔍 Troubleshooting

### **Container não inicia**
```bash
# Verificar logs
docker-compose logs osintmap

# Verificar configuração do nginx
docker exec osintmap-app nginx -t
```

### **Erro 404**
- Verifique se todos os arquivos foram copiados corretamente
- Confirme se o `index.html` está no diretório correto

### **Problemas de performance**
- Ajuste as configurações de cache no `nginx.conf`
- Monitore o uso de recursos: `docker stats osintmap-app`

### **Problemas de rede**
```bash
# Verificar portas em uso
netstat -tulpn | grep :8080

# Testar conectividade
curl http://localhost:8080
```

## 📊 Monitoramento

### **Status da aplicação**
```bash
# Status do container
docker-compose ps

# Recursos utilizados
docker stats osintmap-app

# Logs em tempo real
docker-compose logs -f osintmap
```

### **Health check**
Adicione um health check no `docker-compose.yml`:
```yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost/"]
  interval: 30s
  timeout: 10s
  retries: 3
  start_period: 40s
```

## 🔒 Segurança

### **Headers de segurança**
O `nginx.conf` inclui headers de segurança básicos:
- X-Frame-Options
- X-XSS-Protection
- X-Content-Type-Options
- Content-Security-Policy

### **Atualizações**
Mantenha a imagem base do nginx atualizada:
```bash
# Pull da imagem mais recente
docker pull nginx:alpine

# Rebuild da aplicação
docker-compose build --no-cache
docker-compose up -d
```

---

🎯 **Sua aplicação OSINTMap está pronta para produção!**

Acesse `http://localhost:8080` e comece a usar sua ferramenta de investigação geoespacial. 