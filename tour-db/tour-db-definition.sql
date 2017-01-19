DROP TABLE IF EXISTS player CASCADE;
CREATE TABLE player (
	code	char(3)		NOT NULL,
	name	varchar(25)	DEFAULT NULL,
	PRIMARY KEY(code)
);

DROP TABLE IF EXISTS tournament CASCADE;
CREATE TABLE tournament (
	id		serial		NOT NULL,
	name	varchar(25) NOT NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS rating CASCADE;
CREATE TABLE rating (
	player		char(3)						NOT NULL,
	tournament	integer						DEFAULT NULL,
	rating		integer						DEFAULT NULL,
    cdat		timestamp without time zone	DEFAULT now(),
	-- 
    PRIMARY KEY (player,tournament),
    FOREIGN KEY (player) 		REFERENCES player(code) 	ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (tournament) 	REFERENCES tournament(id) 	ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS game CASCADE;
CREATE TABLE game (
	a1   		char(3)		NOT NULL,
    a2   		char(3)		NOT NULL,
    b1   		char(3)		NOT NULL,
    b2   		char(3)		NOT NULL,
	tournament	integer		DEFAULT NULL,
    score_a		integer		DEFAULT NULL,
    score_b		integer		DEFAULT NULL,
    played		timestamp without time zone		DEFAULT NULL,
	-- 
    FOREIGN KEY (tournament) 	REFERENCES tournament(id) 	ON UPDATE CASCADE ON DELETE CASCADE
);
