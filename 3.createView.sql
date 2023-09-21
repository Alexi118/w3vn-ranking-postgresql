--CREATE VIEW FOR GPLAY RANKING
create or replace view gplay_ranking as
SELECT
     rank() OVER (ORDER BY p.elo DESC),p.name, p.race, ROUND(p.elo),
    ROUND((CASE WHEN (p.win>0)
          THEN 
               (p.win /(p.win + p.lose)*100)
          ELSE
               0
     END))as winrate,
     p.win, p.lose, p.social, p.prev_rank, p.player_id
FROM players p;

--CREATE VIEW FOR RACE STATISTICS
create or replace view race_statistics as
select
    distinct(p.race),
    COUNT(p.race),    
from players p group by p.race;
