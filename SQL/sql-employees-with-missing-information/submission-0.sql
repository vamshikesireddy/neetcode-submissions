-- Write your query below
SELECT employee_id
FROM
(
SELECT employee_id
FROM employees
UNION ALL
SELECT employee_id
FROM salaries)
GROUP BY 1
HAVING COUNT(employee_id) = 1
ORDER BY 1;