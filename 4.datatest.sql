--migrate players
INSERT INTO players(name,race,elo,social,prev_rank)
VALUES('Hell','UD-icon',1200,'cuongnd11@gmail.com',0),
      ('Tenchu','OC-icon',1000,'tenchu@gmail.com',0),
      ('Clark','HU-icon',1500,'clark@gmail.com',0),
      ('Simi','NE',1500,'simi@gmail.com',0);

--migrate matches
INSERT INTO matches(winner,loser)
VALUES 
     ('Hell','Tenchu');

--truncate all row & reset sequences on table
TRUNCATE table players CASCADE;
ALTER SEQUENCE players_player_id_seq RESTART;
TRUNCATE table matches;
ALTER SEQUENCE matches_game_id_seq RESTART;

--migrate players
INSERT INTO players(name,race,elo,social,prev_rank)
VALUES('Peki','HU-icon',2000,'Duong',0),
      ('Fervis','UD-icon',1900,'Tran Tin',0),
      ('Tix3love3','UD-icon',1800,'Hai',0),
      ('Pow','HU-icon',1700,'Nguyen Dinh Vuong',0),
      ('Ninh','RMD-icon',1600,'Austro',0),
      ('Shadow','OC-icon',1500,'Ot Cay',0),
      ('TrieuVoi','OC-icon',1400,'Nguyen Dinh Hoang',0),
      ('Kaioshin','OC-icon',1300,'Dinh Quang Manh',0),
      ('DOMIVN','UD-icon',1200,'Anh Khoa Nguyen',0),
      ('LQUES','OC-icon',1100,'Le Quang',0),
      ('Kingtruong','OC-icon',1000,'Truonggg',0),
      ('dailygao','OC-icon',900,'Dung Phung',0),
      ('delley','UD-icon',800,'Hoang Nhat',0),
      ('baobmtpro','OC-icon',700,'Bao nho',0),
      ('sieuvukhi','UD-icon',600,'Nguyen Hung',0),
      ('Lhd1998','OC-icon',500,'Le Huynh Duc',0),
      ('lich','NE-icon',400,'Nguyen Hoang Lich',0);

--migrate matches
INSERT INTO matches(winner,loser)
VALUES
     ('Fervis','Peki'),
     ('Fervis','Peki'),
     ('Pow','Shadow'),
     ('Pow','Shadow'),
     ('TrieuVoi','Kaioshin'),
     ('TrieuVoi','Kaioshin'),
     ('LQUES','Kingtruong'),
     ('LQUES','Kingtruong'),
     ('Fervis','Pow'),
     ('Fervis','Pow'),
     ('Kaioshin','Kingtruong'),
     ('Kaioshin','Kingtruong'),
     ('Pow','Kingtruong'),
     ('Kingtruong','Pow'),
     ('Pow','Kingtruong');