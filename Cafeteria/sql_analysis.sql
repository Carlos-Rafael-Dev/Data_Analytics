
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

-- Evolução da receita
SELECT 
	DATENAME(MONTH, transaction_date) AS Mes,
	SUM(transaction_qty * unit_price) AS total_revenue,
	SUM(transaction_qty) AS total_sales
FROM [coffee-shop]
GROUP BY DATENAME(MONTH, transaction_date),
		DATEPART(MONTH, transaction_date)
ORDER BY DATEPART(MONTH, transaction_date);

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
-- Tive que unificar o primeiro nome do produto, pois observei que existe variações ex. Latte Lg e Latte Rg (são o mesmo produto com marcas diferentes)
SELECT TOP 10
	LEFT(product_detail,
		CHARINDEX(' ', product_detail + ' ') - 1) AS product_name,
	SUM(transaction_qty) AS total_sold
FROM [coffee-shop]
GROUP BY LEFT(product_detail, CHARINDEX(' ', product_detail + ' ') - 1)
ORDER BY total_sold DESC;

-- Top 10 produtos mais vendidos (por receita)
SELECT TOP 10
	LEFT(product_detail,
		CHARINDEX(' ', product_detail + ' ') - 1) AS product_name,
	SUM(transaction_qty) AS total_sold,
	SUM(total_amount) AS revenue
FROM [coffee-shop]
GROUP BY LEFT(product_detail, CHARINDEX(' ', product_detail + ' ') - 1)
ORDER BY revenue DESC;

-- Categoria mais vendida (por receita)
SELECT
	product_category,
	SUM(transaction_qty) AS total_sold,
	SUM(total_amount) AS revenue
FROM [coffee-shop]
GROUP BY product_category
ORDER BY revenue DESC;

-- ANALISE TEMPORAL

-- Horario de maior pico (por volume)
SELECT 
    DATEPART(HOUR, transaction_time) AS hour_of_day,
    COUNT(DISTINCT transaction_id) AS total_transactions,
    SUM(transaction_qty * unit_price) AS total_revenue
FROM [coffee-shop]
GROUP BY DATEPART(HOUR, transaction_time)
ORDER BY total_transactions DESC;

-- Horario de maior pico por loja (por volume)
SELECT 
    store_location,
    DATEPART(HOUR, transaction_time) AS hour_of_day,
    COUNT(DISTINCT transaction_id) AS total_transactions
FROM [coffee-shop]
GROUP BY store_location, DATEPART(HOUR, transaction_time)
ORDER BY store_location, total_transactions DESC;

-- Dia mais movimentado por faturamento
SELECT 
    DATENAME(WEEKDAY, transaction_date) AS day_of_week,
	SUM(transaction_qty) AS total_sold,
    SUM(transaction_qty * unit_price) AS total_revenue
FROM [coffee-shop]
GROUP BY DATENAME(WEEKDAY, transaction_date),
         DATEPART(WEEKDAY, transaction_date)
ORDER BY total_revenue DESC;

-- Dia mais movimentado por faturamento e loja
SELECT 
    store_location,
    DATENAME(WEEKDAY, transaction_date) AS day_of_week,
	SUM(transaction_qty) AS total_sold,
    SUM(transaction_qty * unit_price) AS total_revenue
FROM [coffee-shop]
GROUP BY store_location,
         DATENAME(WEEKDAY, transaction_date),
         DATEPART(WEEKDAY, transaction_date)
ORDER BY store_location,
         total_revenue DESC;

-- Categoria mais lucrativa por loja
SELECT
	store_location,
	product_category,
	SUM(transaction_qty) AS total_sold,
	SUM(transaction_qty * unit_price) AS total_revenue
FROM [coffee-shop]
GROUP BY store_location, product_category
ORDER BY store_location, total_revenue DESC;

-- Produto mais lucrativo por loja
SELECT
	store_location,
	LEFT(product_detail,
		CHARINDEX(' ', product_detail + ' ') - 1) AS product_name,
	SUM(transaction_qty) AS total_sold,
	SUM(total_amount) AS revenue
FROM [coffee-shop]
GROUP BY store_location, LEFT(product_detail, CHARINDEX(' ', product_detail + ' ') - 1)
ORDER BY store_location, revenue DESC;

-- Produto mais vendido por loja
SELECT
	store_location,
	LEFT(product_detail,
		CHARINDEX(' ', product_detail + ' ') - 1) AS product_name,
	SUM(transaction_qty) AS total_sold,
	SUM(total_amount) AS revenue
FROM [coffee-shop]
GROUP BY store_location, LEFT(product_detail, CHARINDEX(' ', product_detail + ' ') - 1)
ORDER BY store_location, total_sold DESC;

-- Loja com maior faturamento médio diário
SELECT 
    store_location,
    COUNT(DISTINCT CAST(transaction_date AS date)) AS active_days,
    SUM(transaction_qty * unit_price) AS total_revenue,
    SUM(transaction_qty * unit_price) / COUNT(DISTINCT CAST(transaction_date AS date)) AS avg_daily_revenue
FROM [coffee-shop]
GROUP BY store_location
ORDER BY avg_daily_revenue DESC;

-- Verificar receita nos feriados
WITH holidays AS (
	SELECT CAST('2023-01-01' AS date) AS holiday_date, 'New Year' AS holiday_name UNION ALL
	SELECT '2023-01-16', 'Martin Luther King Day' UNION ALL
	SELECT '2023-01-22', 'New year Chinese' UNION ALL
	SELECT '2023-02-12', 'Super Bowl' UNION ALL
	SELECT '2023-02-14', 'Valentines Day' UNION ALL
	SELECT '2023-02-13', 'President Day' UNION ALL
	SELECT '2023-03-17', 'St Patrick Day' UNION ALL
	SELECT '2023-04-07', 'Christ Day' UNION ALL
	SELECT '2023-04-09', 'Easter' UNION ALL
	SELECT '2023-05-14', 'Mother Day' UNION ALL
	SELECT '2023-05-29', 'Memorial Day' UNION ALL
	SELECT '2023-06-14', 'Flag Day' UNION ALL
	SELECT '2023-06-18', 'Father Day' UNION ALL
	SELECT '2023-06-19', 'Juneteeth' UNION ALL
	SELECT '2023-07-04', 'Independence Day'
)
SELECT
	CASE
		WHEN h.holiday_date IS NOT NULL THEN 'Holiday'
		ELSE 'Non-Holiday'
	END AS day_type,
	COUNT(DISTINCT cs.transaction_id) AS total_transactions,
	SUM(cs.transaction_qty * cs.unit_price) AS total_revenue,
	AVG(cs.transaction_qty * cs.unit_price) AS avg_ticket
FROM [coffee-shop] cs
LEFT JOIN holidays h
	ON CAST(cs.transaction_date AS date) = h.holiday_date
GROUP BY
	CASE
		WHEN h.holiday_date IS NOT NULL THEN 'Holiday'
		ELSE 'Non-Holiday'
	END;