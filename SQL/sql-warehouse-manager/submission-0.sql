-- Write your query below

WITH CTE_volume AS
(
SELECT product_id, (width * length * height) AS volume
FROM products)

SELECT w.name as warehouse_name, SUM((c.volume * w.units)) as volume
FROM warehouse w
JOIN CTE_volume as c
ON w.product_id = c.product_id
GROUP BY 1
;