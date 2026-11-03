-- Write your query below   
WITH CTE_teams AS
(
SELECT team, SUM(points) OVER (PARTITION BY team) AS num_points
FROM
(
SELECT host_team as team, host_points as points
FROM
(SELECT match_id, host_team,
CASE
    WHEN host_goals > guest_goals THEN 3
    WHEN host_goals = guest_goals THEN 1
    ELSE 0
END as host_points
FROM matches)
UNION ALL
SELECT guest_team as team, guest_points as points
FROM
(
SELECT match_id, guest_team,
CASE 
    WHEN host_goals  < guest_goals THEN 3
    WHEN host_goals = guest_goals THEN 1
    ELSE 0
END as guest_points
FROM matches  
)
)
)

SELECT DISTINCT t.team_id as team_id, t.team_name as team_name, COALESCE(c.num_points, 0) as num_points
FROM teams t
LEFT JOIN
CTE_teams AS c
ON t.team_id = c.team
ORDER BY 3 DESC;