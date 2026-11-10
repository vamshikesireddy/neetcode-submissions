SELECT DISTINCT account_id
FROM(
SELECT account_id, ((login < LAG(login, 1, login) OVER(PARTITION BY account_id) AND  logout > LAG(logout, 1, logout) OVER(PARTITION BY account_id) ) OR (login BETWEEN LAG(login, 1, login) OVER(PARTITION BY account_id) AND LAG(logout, 1, logout) OVER(PARTITION BY account_id))) and (ip_address != LAG(ip_address) OVER(PARTITION BY account_id)) as test
FROM log_info)
WHERE test =true;