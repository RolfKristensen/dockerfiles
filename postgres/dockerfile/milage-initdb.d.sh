#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER milage_user WITH PASSWORD 'milage_pass';
    CREATE DATABASE milage;
    GRANT ALL PRIVILEGES ON DATABASE milage TO milage_user;
EOSQL
