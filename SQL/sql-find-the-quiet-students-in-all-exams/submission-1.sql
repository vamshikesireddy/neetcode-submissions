-- Write your query below

WITH silent AS
(
SELECT student_id
FROM(
SELECT exam_id, student_id, 
CASE
    WHEN score = MAX(score) OVER(PARTITION BY exam_id) THEN 1 ELSE 0
END AS max_score,
CASE
    WHEN score = MIN(score) OVER(PARTITION BY exam_id) THEN 1 ELSE 0
END AS min_score
FROM exam)
GROUP BY 1
HAVING SUM(max_score) + SUM(min_Score) = 0)

SELECT si.student_id AS student_id, s.student_name AS student_name
FROM silent si
JOIN student s
    ON si.student_id = s.student_id
ORDER BY 1
;