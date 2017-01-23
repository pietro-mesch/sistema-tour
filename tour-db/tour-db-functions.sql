-- CONSTANTS --
CREATE OR REPLACE FUNCTION delta75() RETURNS integer as $$
DECLARE
delta integer := 200;
BEGIN
	RETURN delta;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION max_pot() RETURNS integer as $$
DECLARE
delta integer := 50;
BEGIN
	RETURN delta;
END;
$$ LANGUAGE plpgsql;
-----------------------------------------------------------------------------------------------------



CREATE OR REPLACE FUNCTION player_get_rating(player_code char) RETURNS integer as $$
DECLARE
last_rating integer := 0;
BEGIN
	SELECT rating from rating where player = player_code order by cdat DESC limit 1 INTO last_rating;
	RETURN last_rating;
END;
$$ LANGUAGE plpgsql;

-----------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION game_check_score() RETURNS trigger as $$
BEGIN
	IF (NEW.score_a IS NULL OR NEW.score_b IS NULL) THEN
		RAISE EXCEPTION 'Team scores cannot be NULL.';
	END IF;
	IF NOT (NEW.score_a = 6 OR NEW.score_b = 6) THEN
		RAISE EXCEPTION 'Either team must have reached 6 for the game to be over.';
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
DROP TRIGGER IF EXISTS game_score_check_trig ON game;
CREATE TRIGGER game_score_check_trig BEFORE INSERT OR UPDATE ON game
FOR EACH ROW EXECUTE PROCEDURE game_check_score();


CREATE OR REPLACE FUNCTION game_process_score() RETURNS trigger as $$
DECLARE
rating_a1 integer := 0;
rating_a2 integer := 0;
rating_b1 integer := 0;
rating_b2 integer := 0;
ea double precision :=0;
eb double precision :=0;
ra double precision :=0;
rb double precision :=0;
delta double precision :=0;
BEGIN
	SELECT player_get_rating(NEW.a1) INTO rating_a1;
	SELECT player_get_rating(NEW.a2) INTO rating_a2;
	SELECT player_get_rating(NEW.b1) INTO rating_b1;
	SELECT player_get_rating(NEW.b2) INTO rating_b2;

	ea := 1 / (1 + 10^(0.5 * 0.5 *(rating_a1 + rating_a2 - rating_b1 - rating_b2)/delta75()));
	eb := 1 / (1 + 10^(0.5 * 0.5 *(rating_b1 + rating_b2 - rating_a1 - rating_a2)/delta75()));

	ra := NEW.score_a::double precision / (NEW.score_a::double precision + NEW.score_b::double precision);
	rb := NEW.score_b::double precision / (NEW.score_a::double precision + NEW.score_b::double precision);

	raise notice 'Expected score: % - %', ea, eb;
	raise notice 'Actual   score: % - %', NEW.score_a, NEW.score_b;
	raise notice 'RARB     score: % - %', ra, rb;

	delta := max_pot() * (ra - ea);
	INSERT INTO rating (player, rating) VALUES (NEW.a1, GREATEST(rating_a1 + delta, 0)),(NEW.a2, GREATEST(rating_a2 + delta, 0));

	delta := max_pot() * (rb - eb);
	INSERT INTO rating (player, rating) VALUES (NEW.b1, GREATEST(rating_b1 + delta, 0)),(NEW.b2, GREATEST(rating_b2 + delta, 0));
	
	PERFORM pg_notify('tour_channel','ANO');
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
DROP TRIGGER IF EXISTS game_update_trig ON game;
CREATE TRIGGER game_update_trig AFTER INSERT OR UPDATE ON game
FOR EACH ROW EXECUTE PROCEDURE game_process_score();

----------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION new_player_notify_func() RETURNS trigger as $$
BEGIN
	PERFORM pg_notify('tour_channel','ANO');
	INSERT INTO rating (player, rating) VALUES (NEW.code, 1);
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS player_insert_trig ON player;
CREATE TRIGGER player_insert_trig AFTER INSERT ON player
FOR EACH ROW EXECUTE PROCEDURE new_player_notify_func();