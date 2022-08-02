#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read USERNAME
#Get user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
#Check whether the user exists
if [[ -z $USER_ID ]]
  then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "Guess the secret number between 1 and 1000:"
read GUESS
NUMBER=$(( RANDOM % 1000 + 1 ))
GUESSES=1
echo $NUMBER
#Check whether the entered number is an integer
TEST='^[0-9]+$'
while ! [[ $GUESS =~ $TEST ]]
  do
  echo -e "That is not an integer, guess again:"
  read GUESS
done

#Check guesses
while [[ $GUESS -ne $NUMBER ]]
  do
    if  [[ $GUESS -lt $NUMBER ]]
      then
      echo -e "It's higher than that, guess again:"
      read GUESS
    while ! [[ $GUESS =~ $TEST ]]
      do
      echo -e "That is not an integer, guess again:"
      read GUESS
    done
    elif  [[ $GUESS -gt $NUMBER ]]
      then
      echo -e "It's lower than that, guess again:"
      read GUESS
      while ! [[ $GUESS =~ $TEST ]]
        do
        echo -e "That is not an integer, guess again:"
        read GUESS
      done
    fi
  GUESSES=$(($GUESSES + 1))
done

echo -e "You guessed it in $GUESSES tries. The secret number was $NUMBER. Nice job!"
#Get new user_id
NEW_USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
#Insert game
INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($NEW_USER_ID, $GUESSES)")