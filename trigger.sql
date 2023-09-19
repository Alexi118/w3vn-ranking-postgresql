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

UPDATE public.players SET prev_elo = elo;