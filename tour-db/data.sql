truncate player cascade;
insert into player (code, name) VALUES
('PRO','Andrea Procaccini'),
('EDE','Edmondo Silvestri'),
('PEZ','Marco Pezzulla'),
('MZK','Pietro Meschini'),
('CAP','Daniele Capuano'),
('JUS','Giuseppe Berellini'),
('GIO','Giorgio Maltempi'),
('DAN','Daniele Tiddi');
select * from (SELECT DISTINCT ON (player) * from rating order by player, cdat desc) as t order by rating desc;

TRUNCATE game CASCADE;
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('PEZ','JUS','PRO','EDE',2,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','MZK','PRO','EDE',3,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('PEZ','MZK','PRO','CAP',6,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('PEZ','MZK','DAN','EDE',6,1);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('PEZ','CAP','PRO','JUS',6,2);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('GIO','EDE','PRO','DAN',1,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('DAN','CAP','EDE','JUS',4,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('PEZ','EDE','PRO','MZK',6,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('GIO','DAN','PEZ','EDE',6,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','JUS','GIO','CAP',6,3);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','PRO','CAP','EDE',6,3);