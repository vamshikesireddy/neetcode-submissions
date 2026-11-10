-- Write your query below
SELECT player_id, device_id
FROM(
SELECT player_id, device_id, DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date, device_id) AS first_login
FROM activity)
WHERE first_login = 1;