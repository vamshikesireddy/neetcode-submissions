-- Write your query below
SELECT student_id, exam_id, score
FROM
(SELECT  student_id, exam_id, score, ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY  score DESC, exam_id) as rank
FROM exam_results)
WHERE rank = 1;