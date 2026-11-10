-- Write your query below

WITH sal_rank AS(
SELECT department_id, name, salary, DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS rank_sal
FROM employee)

SELECT d.name AS department, s.name AS employee, s.salary AS salary
FROM department d
JOIN sal_rank s
    ON d.id = s.department_id
WHERE s.rank_sal = 1;