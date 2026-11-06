-- Write your query below
SELECT DISTINCT page_id AS recommended_page
FROM
(
SELECT user_id, page_id
FROM likes
WHERE user_id IN
(
SELECT
CASE
    WHEN user1_id = 1 THEN user2_id
    WHEN user2_id = 1 THEN user1_id
    ELSE 0
END user_id
FROM friendship)
OR user_id = 1)
WHERE page_id NOT IN (SELECT page_id FROM likes WHERE user_id = 1)
ORDER BY 1;
