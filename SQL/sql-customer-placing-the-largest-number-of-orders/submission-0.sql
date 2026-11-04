-- Write your query below

SELECT customer_number
FROM
(
SELECT customer_number,
ROW_NUMBER() OVER(PARTITION BY customer_number) AS row_num
FROM orders)
ORDER BY row_num DESC
LIMIT 1;