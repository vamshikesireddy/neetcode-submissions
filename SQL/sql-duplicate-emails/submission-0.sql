-- Write your query below
SELECT email
FROM(
SELECT email, COUNT(*) u_count
FROM person
GROUP BY 1
)
WHERE u_count > 1;