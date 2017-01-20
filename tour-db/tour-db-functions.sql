CREATE OR REPLACE FUNCTION new_player_notify_func() RETURNS trigger as $$
BEGIN
	PERFORM pg_notify('tour_channel','ANO');
	INSERT INTO rating (player, rating) VALUES (NEW.code, 0);
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS player_insert_trig ON player;
CREATE TRIGGER player_insert_trig AFTER INSERT ON player
FOR EACH ROW EXECUTE PROCEDURE new_player_notify_func();