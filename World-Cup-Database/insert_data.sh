#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "CREATE TABLE IF NOT EXISTS raw_data(
  year INT NOT NULL,
  round VARCHAR(20) NOT NULL,
  winner VARCHAR(20) NOT NULL,
  opponent VARCHAR(20) NOT NULL,
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL
)")

echo $($PSQL "CREATE TABLE IF NOT EXISTS raw_teams(
  raw_team VARCHAR(20) UNIQUE NOT NULL
)")

echo $($PSQL "CREATE TABLE IF NOT EXISTS teams(
  team_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(20) UNIQUE NOT NULL
)")
echo $($PSQL "CREATE TABLE IF NOT EXISTS games(
  game_id SERIAL PRIMARY KEY,
  year INT NOT NULL,
  round VARCHAR(20) NOT NULL,
  winner_id INT REFERENCES teams(team_id) NOT NULL,
  opponent_id INT REFERENCES teams(team_id) NOT NULL,
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL
)")

echo $($PSQL "TRUNCATE TABLE games, teams, raw_data, raw_teams")
echo $($PSQL "ALTER TABLE raw_data DROP CONSTRAINT IF EXISTS fk_winner")
echo $($PSQL "ALTER TABLE raw_data DROP CONSTRAINT IF EXISTS fk_opponent")



echo $($PSQL "\copy raw_data FROM 'games.csv' DELIMITER ',' CSV HEADER")

echo $($PSQL "INSERT INTO teams (name) (
  (SELECT winner FROM raw_data)
  UNION
  (SELECT opponent FROM raw_data)
)")

echo $($PSQL "ALTER TABLE raw_data ADD CONSTRAINT fk_winner FOREIGN KEY(winner) REFERENCES teams(name)")
echo $($PSQL "ALTER TABLE raw_data ADD CONSTRAINT fk_opponent FOREIGN KEY(opponent) REFERENCES teams(name)")



echo $($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
  SELECT a.year, a.round, b.team_id, c.team_id, a.winner_goals, a.opponent_goals
  FROM raw_data a inner join teams b on a.winner = b.name inner join teams c on a.opponent = c.name
")
