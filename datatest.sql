--migrate players
INSERT INTO players(name,race,elo,social)
VALUES('Hell','UD',1200,'cuongnd11@gmail.com'),
      ('Tenchu','OC',1000,'tenchu@gmail.com'),
      ('Clark','HU',1500,'clark@gmail.com'),
      ('Simi','NE',1500,'simi@gmail.com');

--migrate matches
INSERT INTO matches(winner,loser)
VALUES 
     ('Hell','Tenchu');

--truncate all row & reset sequences on table
TRUNCATE table players CASCADE;
ALTER SEQUENCE players_player_id_seq RESTART;
TRUNCATE table matches;
ALTER SEQUENCE matches_game_id_seq RESTART;