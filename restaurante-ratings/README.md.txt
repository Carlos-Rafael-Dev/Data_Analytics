# 🍽️ Benchmarking de Satisfação de Clientes para o Grupo João Mendonça #

## 📊 Sobre o Projeto

Este projeto apresenta uma análise de dados focada em benchmarking competitivo e satisfação de clientes no setor de restaurantes, a partir de uma pesquisa conduzida pelo Instituto Mesa & Mercado (IMM).

O estudo foi encomendado por João Mendonça, empresário do setor gastronômico e proprietário de três restaurantes localizados em cidades diferentes, com posicionamentos distintos de preço e culinária.
O objetivo é entender como cada unidade está posicionada em relação ao mercado e identificar oportunidades práticas de melhoria, mesmo com dados limitados.

## 🏢 Contexto do Negócio

Com o aumento da concorrência e perfis de público distintos entre cidades, o Grupo João Mendonça precisava responder a perguntas estratégicas comuns no mercado:

Como cada restaurante se compara aos concorrentes?

Existem diferenças relevantes de satisfação entre as unidades?

A comida ou o serviço impactam mais a avaliação dos clientes?

O cardápio está alinhado com as preferências do público local?

A pesquisa não possui dados temporais e se baseia em avaliações gerais de clientes.

## 🏪 Restaurantes do Grupo Analisados
### 🍽️ Restaurant Las Mañanitas

Cidade: Cuernavaca, Morelos

Posicionamento: Alto orçamento

Culinária: Internacional

### 🍺 Restaurante La Cantina

Cidade: San Luis Potosí

Posicionamento: Médio orçamento

Culinária: Bar e cervejaria

### 🌮 Puesto de Gorditas

Cidade: Ciudad Victoria, Tamaulipas

Posicionamento: Baixo orçamento

Culinária: Regional

Essa diversidade permite avaliar o impacto de preço, culinária e perfil de público na satisfação dos clientes.

## 🎯 Objetivo de Negócio

Avaliar o desempenho dos restaurantes do Grupo João Mendonça em comparação com o mercado, identificando:

Pontos fortes e fragilidades de cada unidade

Diferenças de desempenho entre cidades

Oportunidades de melhoria em comida, serviço e posicionamento

## 📂 Conjunto de Dados
Tabelas Utilizadas

consumers — Perfil dos clientes entrevistados

consumer_preferences — Preferências de culinária dos consumidores

restaurants — Cadastro dos restaurantes participantes

restaurant_cuisines — Tipos de culinária oferecidos

ratings — Avaliações gerais de comida e serviço

Avaliações

As avaliações são categorizadas como:

Não satisfatório

Satisfatório

Muito satisfatório

⚠️ Limitações:

Ausência de dados temporais

Avaliações categóricas

Não há informações financeiras ou operacionais

## 🛠️ Metodologia
1️. Preparação dos Dados

Padronização de categorias

Tratamento de valores ausentes

Conversão das avaliações categóricas para escala ordinal

Relacionamento entre tabelas (joins)

2️. Análise Exploratória

Distribuição das avaliações

Ranking de restaurantes

Comparação entre comida e serviço

Análise por tipo de culinária

Alinhamento entre preferências dos clientes e culinária oferecida

3️. Visualização e Comunicação

Gráficos comparativos

Rankings e destaques por unidade

Dashboard analítico com foco em dono multiunidade

## 📈 Principais Análises

Benchmarking entre restaurantes do mercado

Comparação direta entre as três unidades do grupo

Avaliação do impacto de comida vs serviço

Desempenho por tipo de culinária

## 💡 Principais Insights

O desempenho varia entre as unidades, mesmo sob o mesmo grupo

O serviço apresenta maior variação de satisfação do que a comida

Restaurantes alinhados às preferências dos clientes tendem a ter avaliações melhores

Cada cidade apresenta um perfil de expectativa diferente

📌 Recomendações

Investir em melhorias de serviço nas unidades com menor avaliação

Replicar boas práticas entre restaurantes do grupo

Ajustar o cardápio conforme preferências locais

Realizar pesquisas periódicas para acompanhar evolução

## 📊 Entregáveis

Dashboard interativo (Power BI / Looker Studio)

Relatório executivo de insights

Notebooks de análise

Scripts de preparação de dados

## 🧰 Ferramentas Utilizadas

Python (Pandas, Matplotlib, Seaborn)

Jupyter Notebook

Power BI

Git & GitHub


## 📁 Estrutura do Projeto
```
restaurant-benchmark-analysis
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 01_exploracao.ipynb
│   ├── 02_limpeza_transformacao.ipynb
│   └── 03_analise.ipynb
│
├── reports/
│   └── insights.pdf
│
└── README.md
```

### 👤 Autor

Carlos Rafael
Analista de Dados Júnior | Front-end React
📍 Brasil

## ⭐ Considerações Finais

Este projeto demonstra a capacidade de conduzir uma análise de dados orientada a negócio, mesmo com limitações de escopo, aplicando conceitos de benchmarking, segmentação e comunicação de insights, competências essenciais para um Analista de Dados Júnior.