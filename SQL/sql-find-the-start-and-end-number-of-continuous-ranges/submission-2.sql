-- Write your query below


WITH logs AS(
SELECT log_id,
CASE
    WHEN LAG(log_id) OVER(ORDER BY log_id) IS NULL THEN 'START'
    WHEN (log_id - LAG(log_id) OVER(ORDER BY log_id)) > 1 THEN 'START'
END AS start_point,
CASE
    WHEN LEAD(log_id) OVER(ORDER BY log_id) IS NULL THEN 'END'
    WHEN (log_id - LEAD(log_id) OVER(ORDER BY log_id)) < -1 THEN 'END'
END AS end_point
FROM logs),

starts AS (
    SELECT
        log_id AS start_id,
        ROW_NUMBER() OVER (ORDER BY log_id) AS rn
    FROM logs
    WHERE start_point = 'START'
),
ends AS (
    SELECT
        log_id AS end_id,
        ROW_NUMBER() OVER (ORDER BY log_id) AS rn
    FROM logs
    WHERE end_point = 'END'
)
SELECT s.start_id AS start_id, e.end_id AS end_id
FROM starts s
JOIN ends e ON s.rn = e.rn
ORDER BY s.start_id;
;  