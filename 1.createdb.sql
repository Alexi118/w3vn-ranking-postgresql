--create players table
CREATE TABLE players(
  player_id SERIAl PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  race VARCHAR(255) NOT NULL,
  elo FLOAT,
  social VARCHAR(255) NOT NULL,
  win FLOAT DEFAULT 0 NOT NULL,
  lose FLOAT DEFAULT 0 NOT NULL,
  prev_rank BIGINT DEFAULT 0 NOT NULL
);

--create matches table
CREATE TABLE matches(
  game_id SERIAl PRIMARY KEY, -- must be consecutive and start at 1!
  winner VARCHAR(255) NOT NULL, -- won player
  loser VARCHAR(255) NOT NULL -- lost player
);

--add constraint
ALTER TABLE matches ADD CONSTRAINT fk_p1name FOREIGN KEY (winner) REFERENCES players(name);
ALTER TABLE matches ADD CONSTRAINT fk_p2name FOREIGN KEY (loser) REFERENCES players(name);