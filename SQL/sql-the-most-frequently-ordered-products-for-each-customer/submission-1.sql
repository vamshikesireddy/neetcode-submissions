-- Write your query below

WITH max_products AS
(
SELECT customer_id, product_id
FROM(
SELECT customer_id, product_id, RANK() OVER(PARTITION BY customer_id ORDER BY COUNT(*) DESC) AS count_products
FROM orders
GROUP BY 1,2)
WHERE count_products = 1)

SELECT m.customer_id AS customer_id, m.product_id AS product_id, p.product_name AS product_name
FROM max_products AS m
JOIN products AS p
    ON m.product_id = p.product_id
JOIN customers c
    ON m.customer_id = c.customer_id
;