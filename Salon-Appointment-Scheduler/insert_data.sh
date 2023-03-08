#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -c"

echo $($PSQL "CREATE TABLE IF NOT EXISTS customers(
  customer_id SERIAL PRIMARY KEY,
  phone VARCHAR(20) UNIQUE,
  name VARCHAR(20)
)")
echo $($PSQL "CREATE TABLE IF NOT EXISTS services (
  service_id SERIAL PRIMARY KEY,
  name VARCHAR(20)
)")
echo $($PSQL "CREATE TABLE IF NOT EXISTS appointments(
  appointment_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  service_id INT REFERENCES services(service_id),
  time VARCHAR(20)
)")

echo $($PSQL "INSERT INTO services(name) VALUES('nail polishing'), ('haircut'), ('botox')")
