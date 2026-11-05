-- Write your query below
SELECT DISTINCT c.title as title
FROM content c
JOIN tv_program t
ON c.content_id = t.content_id
WHERE t.program_date LIKE '2020-06%'AND c.kids_content = 'Y'
AND c.content_type = 'Movies';