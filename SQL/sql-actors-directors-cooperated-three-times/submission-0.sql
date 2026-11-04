-- Write your query below

SELECT actor_id, director_id
FROM actor_director
GROUP BY 1,2
HAVING COUNT(*) >= 3; 