# ☕ Coffee Shop Sales Analysis – Maven Roasters

## 📊 Projeto de Análise de Dados e Dashboard Interativo

Objetivo: Analisar as vendas da rede de cafeterias Maven Roasters e desenvolver um painel interativo para auxiliar o gerente na tomada de decisões sobre estoque, horários e produtos mais rentáveis.

### 🧠 Contexto de Negócio

A Maven Roasters é uma rede fictícia de cafeterias com três unidades em Nova York — Hell's Kitchen, Astoria e Lower Manhattan.
O gerente regional busca entender o comportamento de vendas ao longo do tempo, a performance por loja e produto, e identificar oportunidades de otimização em horários de pico e mix de produtos.

Como Analista de Dados Júnior, fui responsável por:

1. Limpar e explorar o conjunto de dados de vendas;
2. Extrair KPIs e padrões de comportamento;
3. Criar um dashboard interativo em [Power BI];
4. Comunicar os principais insights de negócio.

### 🗂️ Conjunto de Dados

O dataset inclui informações transacionais de vendas, com as seguintes colunas principais:

|Coluna|Descrição|
|------|---------|
|transaction_id	|    Identificador único da transação
|transaction_date|	Data da venda
|transaction_time|	Horário da venda
|transaction_qty|     Quantidade de itens vendidos
|store_id|            ID exclusivo da cafeteria onde a venda ocorreu
|store_location|	    Unidade da cafeteria
|product_id|          ID único do produto vendido
|unit_price|	        Preço unitário
|product_category|    Descrição da categoria do produto
|product_type|        Descrição do tipo do produto
|product_detail|      Descrição de detalhes do produto
|total_amount|	    Valor total da transação

### ⚙️ Ferramentas Utilizadas
|Etapa 	      |Ferramenta	    |Propósito|
|---------|-----------|------------|
|Limpeza e análise	         |SQL / Excel	      |Padronização, cálculos e KPIs
|Visualização e dashboard	 |[Power BI]	      |Criação de painéis interativos
|Documentação	             |Markdown + GitHub	  |Publicação e portfólio
|Storytelling visual	     |Canva (opcional)	  |Mockups e capa do projeto


## 🔍 Perguntas de Negócio Respondidas

📈 Como as vendas evoluíram ao longo do tempo?

📅 Quais dias da semana e horários são mais movimentados?

☕ Quais produtos e categorias geram mais receita?

🏙️ Como as vendas se distribuem entre as três lojas?

💳 Qual o ticket médio?

### 📊 Principais Métricas (KPIs)
|Indicador|	Valor|	Descrição|
|--------|------|-------|
|Receita total|	$ 698.812,33|	Soma de todas as vendas
|Nº de transações| 149.116|	Total de transações registradas
|Ticket médio|	$ 4,69|	Receita média por transação
|Loja com maior receita|	Hell's Kitchen (34% das vendas)|	Unidade com melhor desempenho
|Produto mais vendido|	 Café brasileiro e etiopico|	Em volume
|Categoria mais lucrativa|	Coffee e Tea|	Em receita total

### 💡 Insights Principais

🕗 Horários de pico: 7h–10h concentram o maior volume de vendas.

📅 Dias mais movimentados: Segunda, quinta e sexta.

☕ Produtos campeões: Café brasileiro e etiopico são responsáveis por 13% da receita total.

### 🏙️ Comparativo entre lojas:

Manhattan → maior ticket médio e foco em bebidas premium;

Brooklyn → maior volume de transações, mas ticket menor;

Queens → vendas equilibradas entre comidas e bebidas.

### 🖥️ Painel Interativo

🔗 Acesse o dashboard completo: [Link do Power BI]

### 📘 Recomendações para o Gerente

- Reforçar o estoque e equipe nos horários de pico (7h-10h).

- Criar combos promocionais com os produtos mais vendidos (ex: Latte + Croissant).

- Expandir o horário de funcionamento aos sábados, quando há maior fluxo.

- Treinar equipe de Brooklyn para aumentar o ticket médio (upselling de bebidas premium).


### 🧩 Estrutura do Projeto
`📂 coffee-shop-sales-analysis/
│
├── 📄 README.md
├── 🧠 sql_analysis.sql
├── 📊 coffee_dashboard.pbix / tableau.twbx / looker_link.txt
├── 📈 insights_report.pdf
├── 📁 data/
│   └── coffee_shop_sales.csv
└── 📷 screenshots/
    ├── dashboard_overview.png
    ├── product_analysis.png
    └── sales_trends.png`

### 📚 Aprendizados Técnicos

Durante o projeto, desenvolvi habilidades em:

Modelagem de dados (limpeza, normalização e joins em SQL);

Criação de KPIs e cálculos dinâmicos (DAX / funções SQL);

Design e storytelling de dashboards;

Documentação profissional para portfólio.

### 🚀 Próximos Passos

Aplicar os mesmos conceitos a outros datasets (ex: e-commerce, transporte, finanças);

Integrar Python para análises preditivas;

Criar um portfólio com múltiplos dashboards e relatórios executivos.

✨ Autor
Carlos Rafael
📍 Analista de Dados Júnior
💼 Foco em Business Intelligence, SQL e Visual Analytics
📧 carloshazard@gmail.com
