﻿truncate player cascade;
insert into player (code, name) VALUES
('PRO','Andrea Procaccini'),
('EDE','Edmondo Silvestri'),
('PEZ','Marco Pezzulla'),
('MZK','Pietro Meschini'),
('CAP','Daniele Capuano'),
('JUS','Giuseppe Berellini'),
('GIO','Giorgio Maltempi'),
('TDD','Daniele Tiddi');
select * from (SELECT DISTINCT ON (player) * from rating order by player, cdat desc) as t order by rating desc;

TRUNCATE game CASCADE;
SELECT * FROM game ORDER BY played DESC;
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('JUS','PEZ','PRO','EDE',2,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','CAP','PRO','EDE',3,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','PEZ','PRO','CAP',6,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','PEZ','TDD','EDE',6,1);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','PEZ','PRO','JUS',6,2);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','GIO','PRO','TDD',1,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','TDD','EDE','JUS',4,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','PEZ','PRO','MZK',6,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('TDD','GIO','PEZ','EDE',6,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('JUS','MZK','GIO','CAP',6,3);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('PRO','MZK','CAP','EDE',6,3);

insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('JUS','PEZ','EDE','PRO',2,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','CAP','EDE','PRO',3,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','PEZ','CAP','PRO',6,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','PEZ','EDE','TDD',6,1);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','PEZ','JUS','PRO',6,2);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','GIO','TDD','PRO',1,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','TDD','JUS','EDE',4,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','PEZ','MZK','PRO',6,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('TDD','GIO','EDE','PEZ',6,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('JUS','MZK','CAP','GIO',6,3);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('PRO','MZK','EDE','CAP',6,3);
,,,,,
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('JUS','MZK','EDE','PEZ',1,6);
insert into player (code, name) VALUES ('GPA','Giampaolo Torresi');
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('GPA','JUS','EDE','PEZ',2,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','PEZ','GPA','EDE',6,1);
insert into player (code, name) VALUES ('SIM','Simone DeCristofaro');
insert into player (code, name) VALUES ('CHR','Chiara Creato');
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','PRO','CAP','CHR',6,1);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','PRO','JUS','CAP',6,0);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','PRO','SIM','PEZ',4,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','PRO','CAP','PEZ',6,4);
insert into player (code, name) VALUES ('NTZ','Matteo Sterlicchio');
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','NTZ','JUS','CAP',6,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','MZK','PRO','PEZ',3,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('NTZ','TDD','CAP','GIO',3,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('NTZ','PEZ','EDE','TDD',6,4);
insert into player (code, name) VALUES ('MAX','Massimiliano Matarazzo');
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','EDE','MAX','PRO',2,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MAX','TDD','EDE','CAP',6,2);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MAX','CAP','NTZ','PRO',2,6);

insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('GPA','PEZ','SIM','CAP',6,2);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','PEZ','TDD','PRO',6,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('TDD','EDE','CAP','NTZ',4,6);
insert into player (code, name) VALUES ('CLA','Claudio Petrocelli');
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CLA','TDD','SIM','PRO',3,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','EDE','CAP','PEZ',6,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CLA','TDD','NTZ','PRO',4,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CLA','CAP','EDE','CAP',6,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','PEZ','MAX','PRO',3,6);

insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('GPA','TDD','CAP','PEZ',4,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','NTZ','PRO','EDE',6,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','PEZ','CAP','PRO',6,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','TDD','SIM','NTZ',6,1);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('PRO','PEZ','CAP','MZK',6,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','TDD','EDE','PRO',5,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','SIM','EDE','PRO',5,6);

insert into player (code, name) VALUES ('FOR','Fortunato Rosa');
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','PEZ','CAP','FOR',2,6);
insert into player (code, name) VALUES ('MEL','Melvin Massotti');
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','PRO','MEL','GPA',6,3);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','TDD','EDE','CAP',6,1);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','PEZ','TDD','PRO',6,5);
insert into player (code, name) VALUES ('FER','Ferruccio Fiorucci');
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('FOR','MEL','FER','GPA',6,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','SIM','CAP','MEL',2,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('FOR','PEZ','MZK','PRO',4,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MEL','TDD','CAP','SIM',5,6);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('PRO','MZK','EDE','PEZ',6,3);

insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','TDD','EDE','SIM',3,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','TDD','NTZ','PEZ',3,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','TDD','SIM','PEZ',5,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('PEZ','CAP','SIM','EDE',3,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('NTZ','TDD','PRO','GPA',5,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','PEZ','CAP','PRO',5,1);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','GPA','NTZ','PEZ',2,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','TDD','EDE','PRO',5,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('GPA','PEZ','NTZ','PRO',5,0);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','PRO','SIM','TDD',5,1);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','GPA','TDD','PEZ',4,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','NTZ','CAP','PRO',4,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','PRO','CAP','PEZ',5,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','PRO','CAP','SIM',5,3);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','EDE','SIM','PRO',4,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('PRO','CAP','EDE','JUS',5,0);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('JUS','CAP','PRO','EDE',2,5);

insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('GPA','MEL','EDE','JUS',5,3);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','TDD','JUS','PEZ',5,2);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MEL','GPA','NTZ','PRO',5,1);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('TDD','PEZ','EDE','PRO',4,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('JUS','MEL','GPA','SIM',4,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','PEZ','TDD','NTZ',4,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','GPA','PRO','MEL',3,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','PEZ','CAP','TDD',4,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MEL','PEZ','EDE','PRO',5,0);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('TDD','PRO','CAP','NTZ',5,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','MEL','SIM','PEZ',2,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','TDD','CAP','PRO',4,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','PRO','CAP','MEL',5,2);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MEL','EDE','CAP','PRO',2,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MEL','PRO','CAP','SIM',5,2);

insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('JUS','MZK','EDE','GIO',5,2);
insert into player (code, name) VALUES ('ALE','Alessandro Attanasi');
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('TDD','ALE','EDE','GPA',2,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MEL','MZK','TDD','SIM',5,1);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','PEZ','GPA','PRO',5,2);
insert into player (code, name) VALUES ('RIC','Riccardo Pozzati');
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('TDD','MZK','NTZ','RIC',5,2);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','MZK','TDD','NTZ',5,4);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','TDD','MEL','PEZ',1,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('SIM','PRO','MEL','PEZ',2,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('TDD','MEL','EDE','PRO',5,0);

insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MEL','MZK','FOR','EDE',5,2);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','MZK','GPA','MEL',3,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MEL','PRO','EDE','GPA',5,0);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','MZK','TDD','GPA',2,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MEL','TDD','PRO','PEZ',5,2);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','MZK','FOR','GPA',5,3);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MEL','PRO','EDE','PEZ',5,3);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('CAP','TDD','GPA','FOR',5,3);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MEL','PEZ','EDE','TDD',5,2);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('MZK','PRO','MEL','PEZ',2,5);
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('EDE','PRO','PEZ','TDD',2,5);
insert into player (code, name) VALUES ('AGO','Agostino Annunziata');
insert into game (a1,a2,b1,b2,score_a,score_b) VALUES ('AGO','MZK','MEL','PEZ',5,3);