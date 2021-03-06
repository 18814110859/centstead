#!/usr/bin/env bash

mkdir /etc/cron.d 2>/dev/null

if [ $1 == 'usual' ]
then
    PREFIX='centstead-'
else
    PREFIX='centsteadserve-'
fi

cron="$4 $3 $5"

echo "$cron" > "/etc/cron.d/$PREFIX$2"

systemctl restart crond.service