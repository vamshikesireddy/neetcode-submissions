-- Write your query below
WITH all_dates AS
(
SELECT  'failed' AS period_state, fail_date as date_exe
FROM failed
WHERE fail_date between '2019-01-01' AND '2019-12-31'
UNION ALL
SELECT  'succeeded' AS period_state, success_date as date_exe
FROM succeeded
WHERE success_date between '2019-01-01' AND '2019-12-31'
ORDER BY date_exe),

date_range AS
(
SELECT period_state, date_exe,
CASE
    WHEN LAG(period_state) OVER(ORDER BY date_exe) IS NULL
    OR LAG(period_state) OVER(ORDER BY date_exe) != period_state THEN 1
END AS is_start
FROM all_dates),

group_date AS
(
SELECT period_state,date_exe,
SUM(is_start) OVER (ORDER BY date_exe) AS grp
FROM date_range)

SELECT period_state,
MIN(date_exe) AS start_date,
MAX(date_exe) AS end_date
FROM group_date
GROUP BY period_state, grp
ORDER BY start_date
;