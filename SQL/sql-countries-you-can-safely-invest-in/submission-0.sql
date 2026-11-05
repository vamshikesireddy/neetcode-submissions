-- Write your query below

WITH CTE_calls AS
(
SELECT caller_id as id, duration as duration
FROM calls
UNION ALL
SELECT callee_id as id, duration as duration
FROM calls),

CTE_country AS
(
SELECT p.id as id, c.name
FROM person p
JOIN country c
ON LEFT(p.phone_number, 3) = c.country_code
)


SELECT country.name AS country
FROM CTE_country AS country
JOIN CTE_calls AS calls
ON country.id = calls.id
GROUP BY 1
HAVING ROUND((SUM(calls.duration) * 1.0/COUNT(*)),2) > (SELECT ROUND((SUM(duration) * 1.0/COUNT(*)),2) AS global_average
FROM CTE_calls)
;