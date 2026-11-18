-- Write your query below

WITH RECURSIVE emp_hierarchy AS
(
    SELECT employee_id
    FROM employees
    WHERE employee_id != 1 AND manager_id = 1
    UNION ALL
    SELECT e.employee_id AS employee_id
    FROM employees e
    JOIN emp_hierarchy h 
        ON h.employee_id = e.manager_id
)

SELECT * from emp_hierarchy;