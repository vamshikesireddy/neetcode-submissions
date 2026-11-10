-- Write your query below
SELECT id, name
FROM students
WHERE id NOT IN(
SELECT s.id
FROM students s
JOIN departments d
    ON s.department_id =  d.id);