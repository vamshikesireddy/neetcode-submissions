-- Write your query below
SELECT seat_id
FROM
(
SELECT seat_id, free ,
LAG(free) OVER(ORDER BY seat_id)  as prev,
LEAD(free) OVER(ORDER BY seat_id) as next_seat
FROM cinema)
WHERE (free = 1) AND (prev = 1 or next_seat = 1);