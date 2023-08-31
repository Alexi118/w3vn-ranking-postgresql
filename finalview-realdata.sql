--FINAL QUERY FOR GPLAY RANKING
SELECT 
     p.name, p.race, ROUND(p.elo),
     -- (CASE WHEN (p.elo>=1900)
     --      THEN 'A'
     --      WHEN (p.elo>=1700)
     --      THEN 'B'
     --     WHEN (p.elo>=1300)
     --      THEN 'C'
     --      ELSE 'D'
     -- END)as League,
    (CASE WHEN (p.win>0)
          THEN 
               (p.win /(p.win + p.lose)*100)
          ELSE
               0
     END)as winrate,
     p.win, p.lose, p.social
FROM players p
ORDER BY p.elo DESC;

--migrate players
INSERT INTO players(name,race,elo,social)
VALUES('Peki','HU',2000,'Duong'),
      ('Fervis','UD',1900,'Tran Tin'),
      ('Tix3love3','UD',1800,'Hai'),
      ('Pow','HU',1700,'Nguyen Dinh Vuong'),
      ('Ninh','RND',1600,'Austro'),
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