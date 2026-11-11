-- Write your query below
WITH latest_orders AS
(
SELECT customer_id, order_id, order_date
FROM
(SELECT customer_id, order_id, order_date,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS latest_order
FROM orders)
WHERE latest_order <= 3)

SELECT c.name AS customer_name,
l.customer_id AS customer_id,
l.order_id AS order_id,
l.order_date AS order_date
FROM latest_orders l
JOIN customers c
    ON l.customer_id = c.customer_id
ORDER BY 1,2,4 DESC 
;