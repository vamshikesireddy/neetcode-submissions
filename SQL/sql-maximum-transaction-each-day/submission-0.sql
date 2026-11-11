-- Write your query below
SELECT transaction_id
FROM(
SELECT transaction_id, 
RANK() OVER(PARTITION BY DATE(day) ORDER BY amount DESC) AS rank_amount
FROM transactions)
WHERE rank_amount = 1
ORDER BY transaction_id; 