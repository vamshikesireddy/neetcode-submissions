-- Write your query below

SELECT user_id, max(window_gap) AS biggest_window
FROM
(
SELECT user_id, visit_date, 
LEAD(visit_date,1,DATE '2021-1-1') OVER(PARTITION BY user_id ORDER BY user_id, visit_date) - visit_date  AS window_gap
FROM user_visits)
GROUP BY 1;