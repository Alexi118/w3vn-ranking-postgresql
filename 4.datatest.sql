--migrate players
INSERT INTO players(name,race,elo,social,prev_rank)
VALUES('Hell','UD',1200,'cuongnd11@gmail.com',0),
      ('Tenchu','OC',1000,'tenchu@gmail.com',0),
      ('Clark','HU',1500,'clark@gmail.com',0),
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
INSERT INTO players(name,race,elo,social)
VALUES('Peki','HU',2000,'Duong'),
      ('Fervis','UD',1900,'Tran Tin'),
      ('Tix3love3','UD',1800,'Hai'),
      ('Pow','HU',1700,'Nguyen Dinh Vuong'),
      ('Ninh','RMD',1600,'Austro'),
      ('Shadow','OC',1500,'Ot Cay'),
      ('TrieuVoi','OC',1400,'Nguyen Dinh Hoang'),
      ('Kaioshin','OC',1300,'Dinh Quang Manh'),
      ('DOMIVN','UD',1200,'Anh Khoa Nguyen'),
      ('LQUES','OC',1100,'Le Quang'),
      ('Kingtruong','OC',1000,'Truonggg'),
      ('dailygao','OC',900,'Dung Phung'),
      ('delley','UD',800,'Hoang Nhat'),
      ('baobmtpro','OC',700,'Bao nho'),
      ('sieuvukhi','UD',600,'Nguyen Hung'),
      ('Lhd1998','OC',500,'Le Huynh Duc'),
      ('lich','UD',400,'Nguyen Hoang Lich');

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