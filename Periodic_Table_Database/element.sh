#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

GET_DATA_FROM_DB() {
  ATOMIC_NUMBER=$1
  ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
  ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
  ELEMENT_TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
  ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
  ELEMENT_MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
  ELEMENT_BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
}

DISPLAY_ELEMENT_INFO() {
    echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_POINT celsius and a boiling point of $ELEMENT_BOILING_POINT celsius."
}

DISPLAY_NO_ELEMENT() {
  echo I could not find that element in the database.
}

if [[ ! $1 ]]
then
  echo Please provide an element as an argument.
elif [[ $1 =~ ^[0-9]+$ ]]
then
  ATOMIC_NUMBER=$1
  GET_DATA_FROM_DB $ATOMIC_NUMBER
  if [[ -z $ELEMENT_NAME ]]
  then
    DISPLAY_NO_ELEMENT
  else
  DISPLAY_ELEMENT_INFO $ATOMIC_NUMBER
  fi
elif [[ $1 =~ ^[A-Za-z]$|^[A-Za-z][a-z]$ ]]
then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol ILIKE '$1'")
  if [[ -z $ATOMIC_NUMBER ]]
  then
    DISPLAY_NO_ELEMENT
  else
  GET_DATA_FROM_DB $ATOMIC_NUMBER
  DISPLAY_ELEMENT_INFO $ATOMIC_NUMBER
  fi
elif [[ $1 =~ ^[A-Za-z]{3,}$ ]]
then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name ILIKE '$1'")
  if [[ -z $ATOMIC_NUMBER ]]
  then
    DISPLAY_NO_ELEMENT
  else
  GET_DATA_FROM_DB $ATOMIC_NUMBER
  DISPLAY_ELEMENT_INFO $ATOMIC_NUMBER
  fi
else
  DISPLAY_NO_ELEMENT
fi
