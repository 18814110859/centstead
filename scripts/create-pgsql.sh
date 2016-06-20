#!/usr/bin/env bash

id postgres >& /dev/null
if [ $? -ne 0 ]
then
  exit 0;
fi

DB=$1;

if ! su postgres -c "psql -d $DB -c '\q' 2>/dev/null"; then
    su postgres -c "createdb -O vagrant '$DB'"
fi