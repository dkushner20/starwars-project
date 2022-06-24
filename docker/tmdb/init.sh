#!/bin/bash
set -ex

DIR='/resources'
# Import TMDB SPECIAL JSON FORMAT TO TABLES
TAR_FILES=($(find ${DIR}/datasets -type f -name "*.json.gz"))
for f in "${TAR_FILES[@]}"
do
  TABLE_NAME=$(basename "${f%.*.*}")
  echo "Unzipping ${TABLE_NAME}"
  gzip -fdk ${f}
  echo "${TABLE_NAME} has been unzipped"

  jq -r '[.[]] | @csv' ${f%.*} > "/tmp/$(basename ${f%.*.*}).csv"
  # TODO: Find a faster alternative to sed
  COLUMNS=$(jq -r --stream -n 'foreach inputs[0][-1] as $k ({}; .[$k]+=1; if .[$k]==1 then $k else empty end)' "${f%.*}" | sed '$!s/$/,/')
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    COPY $TABLE_NAME($COLUMNS)
    FROM '/tmp/$(basename ${f%.*.*}).csv'
    DELIMITER ','
    CSV HEADER;
EOSQL
done
rm /tmp/*



# create a postgres docker file to install jq
# add a new container to docker compose that uses this docker file -- make sure to use mappings for volumes like other files
# use an env_file in place of ENVIRONMENTS:

# For bash script
# Find all tar files in directory to loop through, like with csv files
# use jq to extract the json & write it into a csv....use the /tmp/ directory to avoid permission errors
# use jq|sed to extract the string for COLUMNS
# Loop through almost just like the other script...
# Extra Note: you may need in some places ${f%.*.*}) to account for the .json.gz instead of just.csv