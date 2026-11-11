-- Write your query below
WITH product AS
(
SELECT product_id, order_id, order_date
FROM(
SELECT product_id, order_id, order_date, DENSE_RANK() OVER(PARTITION BY product_id ORDER BY order_date DESC) as latest_order
FROM orders)
WHERE latest_order = 1)

SELECT ps.product_name AS product_name,
p.product_id AS product_id,
p.order_id AS order_id,
p.order_date AS order_date
FROM product p
JOIN products ps
    ON p.product_id = ps.product_id
ORDER BY product_name, product_id, order_id 
;