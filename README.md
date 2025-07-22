# OSINTMap - Ferramenta de Investigação Geoespacial

Uma ferramenta web profissional para investigação geoespacial usando a API Overpass do OpenStreetMap. Projetada para analistas OSINT, investigadores e pesquisadores que precisam de pesquisas geográficas precisas com restrições de proximidade.

![image](https://github.com/user-attachments/assets/c888b8f1-96a7-4fa9-b19d-58717eaa417e)

## 🎯 Funcionalidades Principais

### 🗺️ **Pesquisa Geoespacial Avançada**
- **Área de pesquisa personalizada**: Desenhe sua área de investigação diretamente no mapa
- **Pesquisa principal**: Defina os elementos que você procura (escolas, hospitais, comércios, etc.)
- **Complementos de proximidade**: Adicione até 5 critérios de proximidade com distâncias personalizadas
- **Filtros por nome**: Pesquisa exata, contém, ou começa com

### 🎨 **Visualização Interativa**
- **Marcadores coloridos**: Diferenciação visual automática dos tipos de elementos
  - 🔵 **Azul**: Resultados principais da sua pesquisa
  - 🟢 **Verde**: Primeiro complemento (elemento de referência)
  - 🟠 **Laranja**: Segundo complemento
  - 🔴 **Vermelho**: Terceiro complemento
  - 🟣 **Roxo**: Quarto complemento
  - 🟡 **Amarelo**: Quinto complemento

### 📍 **Pesquisa de Endereço Integrada**
- **Geocodificação em tempo real**: Pesquise qualquer endereço com a API Nominatim
- **Sugestões automáticas**: Propostas de endereços durante a digitação
- **Zoom automático**: Navegação direta para o endereço selecionado
- **Marcador temporário**: Visualização do endereço com possibilidade de remoção

### 📊 **Interface de Resultados Separada**
- **Tabela dos resultados principais**: Lista dos elementos encontrados correspondentes à sua pesquisa
- **Tabela dos complementos**: Lista separada dos elementos de referência usados para as restrições de proximidade
- **Zoom interativo**: Clique em uma linha para dar zoom no mapa
- **Links externos**: Acesso direto ao OpenStreetMap e Google Street View

### 📤 **Exportação e Compartilhamento**
- **Exportação JSON**: Relatório completo com metadados e consulta Overpass
- **Exportação CSV**: Dados tabulares para análise no Excel/LibreOffice
- **Cópia de consulta**: Consulta Overpass gerada copiável para uso externo

## 🚀 Guia de Uso

### 1. **Definir a Área de Pesquisa**

1. Clique em **"Desenhar no mapa"**
2. Clique e arraste no mapa para criar um retângulo de pesquisa
3. A área aparece em laranja com as coordenadas exibidas
4. Use **"Limpar a área"** para recomeçar se necessário

### 2. **Configurar a Pesquisa Principal**

1. **Selecione uma categoria**: Serviços, Transporte, Edifícios, etc.
2. **Escolha os tipos**: Marque os tipos específicos (ex: restaurante, escola)
3. **Filtro por nome** (opcional):
   - **Nome exato**: Pesquisa precisa
   - **Contém**: O nome contém o texto
   - **Começa com**: O nome começa com o texto

### 3. **Adicionar Complementos de Proximidade**

1. Clique em **"Adicionar um complemento"**
2. Configure cada complemento:
   - **Categoria e tipos**: Como para a pesquisa principal
   - **Distância**: Raio de proximidade em metros
   - **Nome**: Filtro opcional por nome
3. Repita para até 5 complementos

### 4. **Executar a Pesquisa**

1. Clique em **"Pesquisar"**
2. Aguarde o carregamento (indicador de progresso)
3. Os resultados aparecem no mapa com cores distintas

### 5. **Analisar os Resultados**

#### **No Mapa:**
- **Marcadores coloridos**: Cada tipo de elemento tem sua cor
- **Popups informativos**: Clique em um marcador para ver os detalhes
- **Clique direito**: Acesso direto ao OpenStreetMap

#### **Nas Listas:**
- **🎯 Resultados da pesquisa**: Seus elementos alvo
- **📍 Elementos de referência**: Os complementos usados para as restrições
- **Zoom interativo**: Clique em uma linha para dar zoom no mapa
- **Seleção visual**: Linha selecionada destacada

### 6. **Navegação e Ferramentas**

#### **Pesquisa de Endereço:**
1. Digite um endereço no campo de pesquisa
2. Selecione uma sugestão
3. O mapa dá zoom automaticamente no endereço
4. Um marcador vermelho temporário é adicionado

#### **Exportação dos Dados:**
- **JSON**: Relatório completo com metadados
- **CSV**: Dados para planilha
- **Consulta**: Código Overpass para reutilização

## 📋 Exemplos de Uso

### **Exemplo 1: Escolas perto de transporte**
```
Área: Desenhar ao redor de uma cidade
Pesquisa principal: Categoria "Serviços" → Tipo "Escola"
Complemento 1: Categoria "Transporte" → Tipo "Ponto de ônibus" → Distância 300m
Resultado: Todas as escolas a menos de 300m de um ponto de ônibus
```

### **Exemplo 2: Restaurantes com estacionamento e banco**
```
Área: Centro da cidade
Pesquisa principal: Categoria "Serviços" → Tipo "Restaurante"
Complemento 1: Categoria "Serviços" → Tipo "Estacionamento" → Distância 200m
Complemento 2: Categoria "Serviços" → Tipo "Banco" → Distância 500m
Resultado: Restaurantes com estacionamento a 200m E banco a 500m
```

### **Exemplo 3: Pesquisa por nome específico**
```
Área: Região
Pesquisa principal: Categoria "Serviços" → Tipo "Escola" → Nome contém "Dom Pedro"
Complemento 1: Categoria "Serviços" → Tipo "Correios" → Distância 1000m
Resultado: Escolas contendo "Dom Pedro" com correios a 1km
```

## 🎨 Interface do Usuário

### **Painel de Pesquisa (Esquerda)**
- Configuração da área de pesquisa
- Parâmetros de pesquisa principal
- Gerenciamento dos complementos de proximidade
- Exibição da consulta Overpass gerada

### **Painel de Resultados (Direita)**
- Mapa interativo com marcadores coloridos
- Pesquisa de endereço integrada
- Contador de resultados com distribuição por tipo
- Listas separadas dos resultados e complementos
- Botões de exportação

## 🔧 Funcionalidades Técnicas

### **Consultas Overpass Otimizadas**
- Geração automática de consultas complexas
- Suporte para restrições de proximidade múltiplas
- Gerenciamento de bounding boxes personalizadas
- Filtro por nome com expressões regulares

### **Visualização Avançada**
- Marcadores Leaflet com ícones coloridos
- Popups informativos com links externos
- Zoom automático nos resultados
- Sincronização bidirecional mapa-lista

### **Performance e Confiabilidade**
- Servidores Overpass múltiplos com alternância automática
- Tratamento de erros robusto
- Interface responsiva para todas as telas
- Timeout configurável para as consultas

## 📊 Tipos de Dados Suportados

### **Categorias Principais:**
- **Serviços e equipamentos**: Restaurantes, bancos, hospitais, escolas, etc.
- **Transporte**: Estradas, pontos, estações, pontes, etc.
- **Edifícios**: Residencial, comercial, industrial, público, etc.
- **Elementos naturais**: Água, florestas, parques, praias, etc.
- **Comércios**: Supermercados, lojas, farmácias, etc.
- **Turismo**: Hotéis, atrações, museus, etc.
- **Sítios históricos**: Monumentos, castelos, ruínas, etc.
- **Militar**: Bases, bunkers, áreas de treinamento, etc.
- **Emergências**: Bombeiros, ambulâncias, desfibriladores, etc.
- **Transporte ferroviário**: Estações, metrô, bonde, etc.

### **Filtros Disponíveis:**
- **Por categoria**: Pesquisa ampla por tipo de elemento
- **Por tipo específico**: Seleção múltipla de subtipos
- **Por nome**: Filtro textual com modos exato/contém/começa
- **Por proximidade**: Restrições de distância com elementos de referência

## 🛠️ Instalação e Configuração

### **Pré-requisitos**
- Navegador web moderno (Chrome, Firefox, Safari, Edge)
- Conexão com a Internet para as APIs externas

### **Uso**
1. Abra `index.html` no seu navegador
2. A aplicação carrega automaticamente
3. Nenhuma instalação ou configuração adicional necessária

### **APIs Utilizadas**
- **Overpass API**: Dados do OpenStreetMap
- **Nominatim**: Geocodificação de endereços
- **Leaflet**: Cartografia interativa

## 🔍 Casos de Uso OSINT

### **Investigação Urbana**
- Localizar estabelecimentos com restrições específicas
- Analisar a densidade de serviços em uma área
- Identificar padrões geográficos suspeitos

### **Pesquisa de Pessoas**
- Encontrar locais frequentados com critérios múltiplos
- Analisar o ambiente ao redor de endereços conhecidos
- Identificar pontos de interesse em um perímetro

### **Análise de Segurança**
- Avaliar a acessibilidade aos serviços de emergência
- Identificar as infraestruturas críticas
- Analisar as vias de acesso e fuga

### **Pesquisa Acadêmica**
- Estudos de geografia urbana
- Análise da acessibilidade aos serviços
- Pesquisa em planejamento territorial

## 📝 Notas Técnicas

### **Limitações**
- Dependente da qualidade dos dados do OpenStreetMap
- Timeout de 25 segundos para consultas complexas
- Limitação a 5 complementos de proximidade simultâneos

### **Otimizações**
- Consultas otimizadas para reduzir a carga do servidor
- Cache dos resultados para evitar consultas repetidas
- Interface responsiva para todos os tipos de tela

### **Segurança**
- Nenhum dado pessoal armazenado
- Consultas anônimas para as APIs públicas
- Código fonte aberto e auditável

## 🆘 Suporte e Solução de Problemas

### **Problemas Comuns**
- **Nenhum resultado**: Verifique a área de pesquisa e os critérios
- **Erro do servidor**: A ferramenta alterna automaticamente para outro servidor
- **Mapa não carrega**: Verifique sua conexão com a Internet

### **Dicas de Uso**
- Comece com áreas de pesquisa pequenas
- Use distâncias de proximidade razoáveis (< 5km)
- Teste primeiro sem filtros por nome para validar a área

---

**Desenvolvido para a comunidade OSINT** - Ferramenta livre e de código aberto para investigação geoespacial profissional.
