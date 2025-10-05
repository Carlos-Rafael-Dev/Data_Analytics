
-- Total de registros
SELECT COUNT (*) AS total_registros 
FROM [coffee-shop];

-- Verificando linhas
SELECT TOP 10 *
FROM [coffee-shop];

-- Verificar se existe valores vazios
SELECT *
FROM [coffee-shop]
	WHERE 
		transaction_date IS NULL OR
		transaction_time IS NULL OR
		transaction_qty IS NULL OR
		store_location IS NULL OR
		unit_price IS NULL OR
		product_category IS NULL OR
		product_type IS NULL OR
		product_detail IS NULL OR
		total_amount IS NULL;

-- Verificar categorias e locais unicos
SELECT DISTINCT store_location FROM [coffee-shop];
SELECT DISTINCT product_category FROM [coffee-shop];
SELECT DISTINCT product_type FROM [coffee-shop];
SELECT DISTINCT product_detail FROM [coffee-shop];

-- Verificar se total_amount está correto
SELECT TOP 10
	transaction_id,
	transaction_qty,
	unit_price,
	total_amount,
	(transaction_qty * unit_price) AS calculado
FROM [coffee-shop]
WHERE total_amount <> (transaction_qty * unit_price);

-- Verificar receita total e quantidade de transações
SELECT
	SUM(total_amount) AS total_revenue,
	COUNT(transaction_id) AS total_transactions
FROM [coffee-shop];

-- Ticket médio
SELECT
	SUM(total_amount) / COUNT(transaction_id) AS avg_ticket
FROM [coffee-shop];

-- Receita por loja
SELECT
	store_location,
	COUNT(transaction_id) AS transactions,
	SUM(total_amount) AS total_sales,
	AVG(total_amount) AS avg_ticket
FROM [coffee-shop]
GROUP BY store_location
ORDER BY total_sales DESC;

-- Top 10 tipos de produtos mais vendidos (por volume)
SELECT TOP 10
	product_type,
	SUM(transaction_qty) AS total_sold,
	SUM(total_amount) AS revenue
FROM [coffee-shop]
GROUP BY product_type
ORDER BY total_sold DESC;

-- Top 10 produtos mais vendidos (por volume)
SELECT TOP 10
	product_detail,
	SUM(transaction_qty) AS total_sold,
	SUM(total_amount) AS revenue
FROM [coffee-shop]
GROUP BY product_detail
ORDER BY total_sold DESC;

-- Top 10 tipos de produtos mais vendidos (por receita)
SELECT TOP 10
	product_type,
	SUM(transaction_qty) AS total_sold,
	SUM(total_amount) AS revenue
FROM [coffee-shop]
GROUP BY product_type
ORDER BY revenue DESC;

-- Top 10 produtos mais vendidos (por receita)
SELECT TOP 10
	product_detail,
	SUM(transaction_qty) AS total_sold,
	SUM(total_amount) AS revenue
FROM [coffee-shop]
GROUP BY product_detail
ORDER BY revenue DESC;

-- Categoria mais vendida (por receita)
SELECT
	product_category,
	SUM(transaction_qty) AS total_sold,
	SUM(total_amount) AS revenue
FROM [coffee-shop]
GROUP BY product_category
ORDER BY revenue DESC;
