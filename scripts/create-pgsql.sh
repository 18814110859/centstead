#!/usr/bin/env bash

DB=$1;
if ! su postgres -c "psql -d $DB -c '\q' 2>/dev/null"; then
    su postgres -c "createdb -O vagrant '$DB'"
fi