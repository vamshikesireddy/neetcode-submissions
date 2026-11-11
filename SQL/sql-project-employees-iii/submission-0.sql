-- Write your query below

WITH emp_rank AS
(
SELECT project_id, employee_id,
RANK() OVER(PARTITION BY project_id ORDER BY experience_years DESC) AS exp_rank
FROM(
SELECT p.project_id AS project_id,
e.employee_id AS employee_id,
e.experience_years AS experience_years
FROM project p
JOIN employee e
    ON p.employee_id = e.employee_id
)
)

SELECT project_id, employee_id
FROM emp_rank
WHERE exp_rank = 1
ORDER BY 1 
;