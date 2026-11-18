-- Write your query below

WITH RECURSIVE c_tasks AS(
    SELECT task_id, subtasks_count, 1 AS task_count
    FROM tasks
    WHERE task_id IN (SELECT task_id FROM tasks)
    UNION ALL
    SELECT c.task_id AS task_id, c.subtasks_count, c.task_count+1 AS task_count
    FROM c_tasks AS c
    WHERE task_count < c.subtasks_count
)

SELECT c.task_id as task_id, c.task_count as subtask_id 
FROM c_tasks c
WHERE (c.task_id, c.task_count) NOT IN 
(SELECT task_id, subtask_id
FROM executed)
ORDER BY 1, 2;