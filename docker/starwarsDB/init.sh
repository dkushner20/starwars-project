#!/bin/bash
set -ex

DIR='/resources/datasets/starwars'

CSV_FILES=($(find ${DIR} -name "*.csv"))
for f in "${CSV_FILES[@]}"
do
  TABLE_NAME=$(basename "${f%.*}")
  COLUMNS=$(head -n 1 "${f}")
  echo  "Importing ${TABLE_NAME}"
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    COPY ${TABLE_NAME}($COLUMNS)
    FROM '${f}'
    DELIMITER ','
    CSV HEADER;
EOSQL
  echo  "Successfully imported ${TABLE_NAME}"
done