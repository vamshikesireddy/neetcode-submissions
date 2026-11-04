-- Write your query below

SELECT DISTINCT user_id, MAX(time_stamp) OVER(PARTITION BY user_id) AS last_stamp
FROM
(
SELECT user_id, time_stamp
FROM logins
WHERE time_stamp >= '2020-01-01' 
  AND time_stamp < '2021-01-01');