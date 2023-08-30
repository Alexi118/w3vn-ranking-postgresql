--trigger update the win/lose on players when insert matches
CREATE OR REPLACE FUNCTION func_set_win_lose_to_players()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
AS 
$$
DECLARE 
  loserOnMatch VARCHAR(255);
  winnerOnMatch VARCHAR(255);
BEGIN
  winnerOnMatch := (SELECT m.winner FROM public.matches m WHERE m.game_id = NEW.game_id);
  loserOnMatch := (SELECT m.loser FROM public.matches m WHERE m.game_id = NEW.game_id);
  UPDATE public.players SET win = (win + 1) WHERE players.name = winnerOnMatch;
  UPDATE public.players SET lose = (lose + 1) WHERE players.name = loserOnMatch;
  return NEW;
END;
$$;

DROP TRIGGER IF EXISTS trigger_set_win_lose_to_players on matches;

CREATE TRIGGER trigger_set_win_lose_to_players
  AFTER INSERT
  ON matches
  FOR EACH ROW
EXECUTE FUNCTION func_set_win_lose_to_players();

--trigger update the +/- MMR Elo rating on players when insert matches
CREATE OR REPLACE FUNCTION func_update_MMR_gain_lost()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
AS 
$$
DECLARE 
  winnerOnMatch VARCHAR(255);
  loserOnmatch VARCHAR(255);
  p1MMR FLOAT;
  p2MMR FLOAT;
  P1 FLOAT;
  P2 FLOAT;
  winnerWithLowerMMR FLOAT;
  winnerWithHigherMMR FLOAT;
  loserWithLowerMMR FLOAT;
  loserWithHigherMMR FLOAT;
BEGIN
  winnerOnMatch := (SELECT m.winner FROM public.matches m WHERE m.game_id = NEW.game_id);
  loserOnmatch := (SELECT m.loser FROM public.matches m WHERE m.game_id = NEW.game_id);
  p1MMR := (SELECT p.elo FROM public.players p WHERE p.name = winnerOnMatch);
  p2MMR := (SELECT p.elo FROM public.players p WHERE p.name = loserOnMatch);

  P1 = (1.0 / (1.0 + pow(10, ((p2MMR - p1MMR) / 400))));
  P2 = (1.0 / (1.0 + pow(10, ((p1MMR - p2MMR) / 400))));
  IF p1MMR>p2MMR THEN
    UPDATE public.players SET elo = p1MMR + 30 * (1-P1) WHERE players.name = winnerOnMatch;
    UPDATE public.players SET elo = p2MMR + 30 * (0-P2) WHERE players.name = loserOnMatch;
  ELSE 
    UPDATE public.players SET elo = p1MMR + 30 * (1-P1) WHERE players.name = winnerOnMatch;
    UPDATE public.players SET elo = p2MMR + 30 * (0-P2) WHERE players.name = loserOnMatch;
  END IF;
  return NEW;
END;
$$;

DROP TRIGGER IF EXISTS trigger_update_MMR_gain_lost on matches;

CREATE TRIGGER trigger_update_MMR_gain_lost
  AFTER INSERT
  ON matches
  FOR EACH ROW
EXECUTE FUNCTION func_update_MMR_gain_lost();