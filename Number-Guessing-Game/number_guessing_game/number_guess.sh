#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=1
echo -e "\n~~~Number Guessing Game~~~\n"

PLAY_THE_GAME() {
  read USER_GUESS
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    PLAY_THE_GAME
  else
    
    if [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
    then
      ((NUMBER_OF_GUESSES++))
      echo -e "\nIt's lower than that, guess again:"
      PLAY_THE_GAME
    elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
    then
      ((NUMBER_OF_GUESSES++))
      echo -e "\nIt's higher than that, guess again:"
      PLAY_THE_GAME
    else

      if [[ -z $CHECK_USERNAME_IN_DB ]]
        then
        QUERY_RESULT=$($PSQL "INSERT INTO games VALUES('$USERNAME', 1, $NUMBER_OF_GUESSES)")
        echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      else
        GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE username = '$USERNAME'")
        ((GAMES_PLAYED++))
        QUERY_RESULT=$($PSQL "UPDATE games SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME'")
        QUERY_RESULT=$($PSQL "UPDATE games SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
        echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      fi 

    fi

  fi
}

ENTER_USERNAME() {
  echo "Enter your username:"
  read USERNAME
  if [[ ! $USERNAME =~ ^[A-Za-z0-9._-]{1,22}$ ]]
  then
    echo -e "\nYour username must be at least 1 and max 22 characters long"
    ENTER_USERNAME
  else
    
    CHECK_USERNAME_IN_DB=$($PSQL "SELECT username FROM games WHERE username LIKE '$USERNAME'")
    if [[ -z $CHECK_USERNAME_IN_DB ]]
    then
      echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
      echo "Guess the secret number between 1 and 1000:"
      PLAY_THE_GAME
    else

      GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE username LIKE '$USERNAME'")
      BEST_GAME=$($PSQL "SELECT best_game FROM games WHERE username LIKE '$USERNAME'")
      echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
      echo "Guess the secret number between 1 and 1000:"
      PLAY_THE_GAME
    fi

  fi
}

ENTER_USERNAME
