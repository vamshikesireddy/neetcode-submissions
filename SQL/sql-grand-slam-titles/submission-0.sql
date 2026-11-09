-- Write your query below

WITH champions AS
(
SELECT p_tournament, COUNT(*) AS grand_slams_count
FROM(
SELECT wimbledon as p_tournament
FROM championships
UNION ALL
SELECT fr_open as p_tournament
FROM championships
UNION ALL
SELECT us_open as p_tournament
FROM championships
UNION ALL
SELECT au_open as p_tournament
FROM championships)
GROUP BY 1)


SELECT player_id, player_name, grand_slams_count
FROM players
JOIN champions
    ON players.player_id = champions.p_tournament

;
