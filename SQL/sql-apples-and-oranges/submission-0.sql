
WITH CTE_apple AS
(
SELECT sale_date, sold_num
FROM sales
WHERE fruit = 'apples'
),

CTE_orange AS
(
SELECT sale_date, sold_num
FROM sales
WHERE fruit = 'oranges'
)

SELECT a.sale_date AS sale_date, (a.sold_num - o.sold_num) AS diff
FROM CTE_apple as a
JOIN CTE_orange as o
    ON a.sale_date = o.sale_date;