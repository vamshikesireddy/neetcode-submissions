-- Write your query below

WITH CTE_transactions AS
(
SELECT account, SUM(amount) AS balance
FROM transactions
GROUP BY 1
HAVING SUM(amount) > 10000)

SELECT u.name AS name, t.balance AS balance
FROM users u
JOIN CTE_transactions t
ON u.account = t.account;