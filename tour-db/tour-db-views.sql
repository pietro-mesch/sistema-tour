CREATE OR REPLACE VIEW player_ranking AS
SELECT * FROM (SELECT DISTINCT ON (player) * from rating order by player, cdat desc) as t order by rating desc;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW ko AS
SELECT 	player.code,
	t_kos.score_a,
	t_kos.score_b
	
FROM	player,
	(SELECT a1, a2, b1, b2, score_a, score_b FROM game WHERE score_a = 0 OR score_b = 0) as t_kos

WHERE	((t_kos.a1  = player.code OR t_kos.a2 = player.code) AND t_kos.score_a = 0) OR ((t_kos.b1  = player.code OR t_kos.b2 = player.code) AND t_kos.score_b = 0);

CREATE OR REPLACE VIEW player_ko_ranking AS
SELECT code, COUNT (*) 
FROM ko
GROUP BY code 
ORDER BY count DESC;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW perfect AS
SELECT 	player.code,
	t_kos.score_a,
	t_kos.score_b
	
FROM	player,
	(SELECT a1, a2, b1, b2, score_a, score_b FROM game WHERE score_a = 0 OR score_b = 0) as t_kos

WHERE	((t_kos.a1  = player.code OR t_kos.a2 = player.code) AND t_kos.score_b = 0) OR ((t_kos.b1  = player.code OR t_kos.b2 = player.code) AND t_kos.score_a = 0);

CREATE OR REPLACE VIEW player_perfect_ranking AS
SELECT code, COUNT (*) 
FROM perfect
GROUP BY code 
ORDER BY count DESC;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW best_team AS
SELECT	team,
	count(*) as wins,
	round(avg(lo_score::double precision)::numeric,3) as average_opponent_score
FROM
	(SELECT (a1 || '+' || a2) as team, score_b as lo_score FROM game WHERE score_a > score_b
	UNION ALL
	SELECT (b1 || '+' || b2) as team, score_a as lo_score FROM game WHERE score_b > score_a) as t_team_wins

GROUP BY team
ORDER BY wins DESC;

CREATE OR REPLACE VIEW worst_team AS
SELECT	team,
	count(*) as losses,
	round(avg(lo_score::double precision)::numeric,3) as average_score
FROM
	(SELECT (a1 || '+' || a2) as team, score_a as lo_score FROM game WHERE score_a < score_b
	UNION ALL
	SELECT (b1 || '+' || b2) as team, score_b as lo_score FROM game WHERE score_b < score_a) as t_team_losses

GROUP BY team
ORDER BY losses DESC;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------