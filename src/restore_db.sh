#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d svy_security -f /dumps/svy_security_dump.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d example_data -f /dumps/example_data_dump.sql