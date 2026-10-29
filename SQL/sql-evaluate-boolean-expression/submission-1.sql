-- Write your query below


SELECT e.left_operand, e.operator, e.right_operand,
CASE e.operator
    WHEN '=' THEN v.value = v1.value
    WHEN '>' THEN v.value > v1.value
    WHEN '<' THEN v.value < v1.value
END AS value
FROM expressions e
LEFT JOIN variables  v
    ON e.left_operand = v.name
LEFT JOIN variables v1
    ON e.right_operand = v1.name;



