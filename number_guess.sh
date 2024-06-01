#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"
read USERNAME

GET_NAME=$($PSQL "SELECT username FROM player WHERE username='$USERNAME'")
GET_ID=$($PSQL "SELECT player_id FROM player WHERE username='$USERNAME'")

if [[  -z $GET_NAME ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
  INSERT_NEW_PLAYER=$($PSQL "INSERT INTO player(username) VALUES('$USERNAME')")
else
  HIGH_SCORE=$($PSQL "SELECT MIN(guesses) FROM games LEFT JOIN player USING(player_id) WHERE username='$GET_NAME'")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games LEFT JOIN player USING (player_id) WHERE username='$GET_NAME'")

  echo -e "\nWelcome back, $GET_NAME! You have played $GAMES_PLAYED games, and your best game took $HIGH_SCORE guesses."

fi

RAND_NUMBER=$(( RANDOM % 1000 + 1 ))
echo $RAND_NUMBER
GUESS=0

echo -e "\nGuess the secret number between 1 and 1000:"
read USER_GUESS

until [[ $USER_GUESS == $RAND_NUMBER ]]
do
  
 
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
      read USER_GUESS
      ((GUESS++))

    else
      if [[ $USER_GUESS < $RAND_NUMBER ]]
        then
          echo "It's higher than that, guess again:"
          read USER_GUESS
          ((GUESS++))
        else 
          echo "It's lower than that, guess again:"
          read USER_GUESS
          ((GUESS++))
      fi  
  fi

done

((GUESS++))

GET_USER_ID=$($PSQL "SELECT player_id FROM player WHERE username='$USERNAME'")

INSERT_GAME=$($PSQL "INSERT INTO games(player_id, guesses, final_number) VALUES($GET_USER_ID, $GUESS, $RAND_NUMBER)")

echo You guessed it in $GUESS tries. The secret number was $RAND_NUMBER. Nice job\!