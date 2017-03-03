CREATE OR REPLACE VIEW player_ranking AS
SELECT * FROM (SELECT DISTINCT ON (player) * from rating order by player, cdat desc) as t order by rating desc;
