-- Total sales and profit in 2025
SELECT 
	ROUND(SUM(total_revenue),0) AS "2025 revenue", 
    ROUND(SUM(profit)) AS "2025 profit", 
    ROUND(SUM(profit)/SUM(total_revenue)*100,2) AS "profit margin"
FROM sales
WHERE YEAR(transaction_datetime) = 2025;

-- Total sales and profit in 2024
SELECT 
	ROUND(SUM(total_revenue),0) AS "2024 revenue", 
	ROUND(SUM(profit)) AS "2024 profit", 
    ROUND(SUM(profit)/SUM(total_revenue)*100,2) AS "profit margin"
FROM sales
WHERE YEAR(transaction_datetime) = 2024;

-- transaction count in 2025
SELECT COUNT(*) AS "transaction_count"
FROM sales
WHERE YEAR(transaction_datetime)=2024;

-- AOV in 2025
SELECT ROUND(SUM(total_revenue)/COUNT(*),2)
FROM sales
WHERE YEAR(transaction_datetime)=2025;

-- AOV per store in 2025
SELECT store_name, ROUND(SUM(total_revenue)/COUNT(*),2)
FROM sales s
JOIN stores st ON s.store_id = st.store_id
WHERE YEAR(transaction_datetime)=2025
GROUP BY store_name;

-- AOV in 2024
SELECT ROUND(SUM(total_revenue)/COUNT(*),2)
FROM sales
WHERE YEAR(transaction_datetime)=2024;

-- Percentage increase 2025 compared to 2024
SELECT ((SELECT SUM(total_revenue) FROM sales WHERE YEAR(transaction_datetime)=2025) -
(SELECT SUM(total_revenue) FROM sales WHERE YEAR(transaction_datetime)=2024)) /
(SELECT SUM(total_revenue) FROM sales WHERE YEAR(transaction_datetime)=2024) * 100 AS "rate of change"
;

-- Total sales, profit, profit margin by month in 2025
SELECT 
	MONTH(transaction_datetime) AS "Month", 
    ROUND(SUM(total_revenue)) AS "monthly revenue", 
    ROUND(SUM(profit)) AS "monthly profit", 
    ROUND(SUM(profit)/SUM(total_revenue)*100) AS "profit margin"
FROM sales
WHERE YEAR(transaction_datetime) = 2025
GROUP BY MONTH(transaction_datetime)
ORDER BY 1;

-- Total sales, profit, profit margin by month in 2024
SELECT 
	MONTH(transaction_datetime) AS "Month", 
    ROUND(SUM(total_revenue)) AS "monthly revenue", 
    ROUND(SUM(profit)) AS "monthly profit", 
    ROUND(SUM(profit)/SUM(total_revenue)*100) AS "profit margin"
FROM sales
WHERE YEAR(transaction_datetime) = 2024
GROUP BY MONTH(transaction_datetime)
ORDER BY 1;

-- count of products
SELECT count(distinct product_name)
FROM products;

-- sales per product in 2025
SELECT 
	p.product_name, 
    ROUND(SUM(s.total_revenue)) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE YEAR(transaction_datetime) = 2025
GROUP BY 1
ORDER BY 2 DESC;

-- top 5 products revenue
WITH product_rank AS (
SELECT 
	p.product_name, 
    ROUND(SUM(s.total_revenue)) AS revenue, 
    ROW_NUMBER() OVER(ORDER BY ROUND(SUM(s.total_revenue)) DESC) AS product_rank
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE YEAR(transaction_datetime) = 2025
GROUP BY 1
ORDER BY 2 DESC)
SELECT SUM(revenue) AS "top 5 revenue"
FROM product_rank
WHERE product_rank <= 5
;

-- sales per store
SELECT 
	st.store_name, 
    ROUND(SUM(s.total_revenue)) AS revenue
FROM sales s
JOIN stores st ON s.store_id = st.store_id
WHERE YEAR(transaction_datetime) = 2025
GROUP BY 1
ORDER BY 2 DESC;


