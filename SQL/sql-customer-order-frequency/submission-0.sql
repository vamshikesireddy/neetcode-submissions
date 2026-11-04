-- Write your query below

WITH CTE_june AS
(
SELECT o.customer_id, 
EXTRACT(YEAR FROM order_date) AS order_year,
EXTRACT(MONTH FROM order_date) AS order_month,
SUM((p.price * o.quantity))  
FROM orders o
JOIN product p
ON o.product_id = p.product_id
WHERE o.order_date >= '2020-06-1' AND o.order_date < '2020-07-1'
GROUP BY 1,2,3
HAVING SUM((p.price * o.quantity)) >= 100),

CTE_july AS
(
SELECT o.customer_id, 
EXTRACT(YEAR FROM order_date) AS order_year,
EXTRACT(MONTH FROM order_date) AS order_month,
SUM((p.price * o.quantity))  
FROM orders o
JOIN product p
ON o.product_id = p.product_id
WHERE o.order_date >= '2020-07-1' AND o.order_date < '2020-08-1'
GROUP BY 1,2,3
HAVING SUM((p.price * o.quantity)) >=100),

CTE_combo AS
(
SELECT june.customer_id AS customer_id
FROM CTE_june as june
JOIN CTE_july as july
ON june.customer_id = july.customer_id)

SELECT c.customer_id AS customer_id, c.name AS name
FROM customers c
JOIN CTE_combo combo
ON c.customer_id = combo.customer_id
;