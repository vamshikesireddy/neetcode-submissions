-- Write your query below
WITH CTE_distance AS
(
SELECT  r.user_id AS user_id, SUM(distance) AS travelled_distance
FROM rides r
GROUP BY 1
)
SELECT u.name, 
CASE
    WHEN c.travelled_distance IS NULL THEN 0 ELSE c.travelled_distance
END AS travelled_distance
FROM users u
LEFT JOIN CTE_distance c
ON u.id = c.user_id
ORDER BY 2 DESC, 1
;