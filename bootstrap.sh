#!/bin/bash

set -e

psql <<- EOSQL
    CREATE USER dbal;
    CREATE DATABASE attendance;
    GRANT ALL PRIVILEGES ON DATABASE attendance TO dbal;
EOSQL

echo 'Running restore...'

pg_restore -d attendance --role=postgres attendance.backup

echo 'Finished Restore.'

echo 'Applying Functions...'

#psql -d attendance -f '/scripts/install.sql'

echo 'Finished Applying Functions.'

