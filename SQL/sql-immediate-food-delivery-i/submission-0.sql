-- Write your query below

SELECT ROUND((SUM(c_perf) * 100.0 / COUNT(*)) , 2) AS immediate_percentage
FROM
(
SELECT 
CASE
    WHEN order_date = customer_pref_delivery_date THEN 1
    ELSE 0
END AS c_perf
FROM delivery);