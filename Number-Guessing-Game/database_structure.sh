PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo $($PSQL "CREATE TABLE IF NOT EXISTS games(
  username VARCHAR(22) PRIMARY KEY,
  games_played INT,
  best_game INT
)")
