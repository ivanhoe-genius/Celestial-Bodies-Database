#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

echo $($PSQL "ALTER TABLE properties RENAME COLUMN weight TO atomic_mass")

echo $($PSQL "ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius")
echo $($PSQL "ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius")

echo $($PSQL "ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL")
echo $($PSQL "ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL")

echo $($PSQL "ALTER TABLE elements DROP CONSTRAINT IF EXISTS elements_symbol_name_key")
echo $($PSQL "ALTER TABLE elements ADD UNIQUE(symbol, name)")

echo $($PSQL "ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL")
echo $($PSQL "ALTER TABLE elements ALTER COLUMN name SET NOT NULL")

echo $($PSQL "ALTER TABLE properties DROP CONSTRAINT IF EXISTS properties_atomic_number_fkey")
echo $($PSQL "ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number) ON DELETE CASCADE")

echo $($PSQL "CREATE TABLE IF NOT EXISTS types(
  type_id INT PRIMARY KEY,
  type VARCHAR(20) NOT NULL
)")

echo $($PSQL "TRUNCATE TABLE types")
echo $($PSQL "INSERT INTO types VALUES(1, 'nonmetal'), (2, 'metal'), (3, 'metalloid')")

echo $($PSQL "ALTER TABLE properties ADD COLUMN IF NOT EXISTS type_id INT")
echo $($PSQL "UPDATE properties 
              SET type_id = (SELECT type_id FROM types WHERE properties.type = types.type)
")
echo $($PSQL "ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL")
echo $($PSQL "ALTER TABLE properties DROP CONSTRAINT IF EXISTS properties_type_id_fkey")
echo $($PSQL "ALTER TABLE properties ADD FOREIGN KEY(type_id) REFERENCES types(type_id)")

echo $($PSQL "UPDATE elements SET symbol = INITCAP(symbol)")

echo $($PSQL "ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL")
echo $($PSQL "UPDATE properties SET atomic_mass = atomic_mass::REAL")

echo $($PSQL "INSERT INTO elements VALUES(9, 'F', 'Fluorine'), (10, 'Ne', 'Neon')")
echo $($PSQL "INSERT INTO properties(atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) 
              VALUES(9, 18.998, -220, -188.1, 1), (10, 20.18, -248.6, -246.1, 1)")
echo $($PSQL "UPDATE properties 
              SET type = (SELECT type FROM types WHERE properties.type_id = types.type_id)")

echo $($PSQL "ALTER TABLE properties DROP COLUMN IF EXISTS type")

echo $($PSQL "DELETE FROM elements WHERE atomic_number = 1000")
