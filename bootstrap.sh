#!/bin/bash

set -e

echo Database name: ${DB_NAME}

psql <<- EOSQL
    CREATE USER dbal;
    CREATE DATABASE ${DB_NAME};
    GRANT ALL PRIVILEGES ON DATABASE ${DB_NAME} TO dbal;
EOSQL

echo 'Running restore...'

pg_restore -d ${DB_NAME} --role=postgres ${DB_NAME}.backup

echo 'Finished Restore.'

echo 'Applying Functions...'

#psql -d ${DB_NAME} -f '/scripts/install.sql'

echo 'Finished Applying Functions.'

