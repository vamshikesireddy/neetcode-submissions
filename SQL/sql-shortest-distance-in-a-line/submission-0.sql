-- Write your query below
SELECT MIN(distance) as shortest
FROM
(
SELECT x, ABS(LEAD(x, 1, 0) OVER() - x) AS distance
FROM point); 