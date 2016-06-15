#!/usr/bin/env bash

mkdir -p /home/vagrant/supervisor

chown vagrant.vagrant /home/vagrant/supervisor

block="[program:$1]
process_name=%(program_name)s_%(process_num)02d
command=/usr/bin/php $2/artisan queue:work $3 --queue=$4 --sleep=3 --tries=3 --daemon
autostart=true
autorestart=true
startsecs=10
startretries=5
user=vagrant
numprocs=2
redirect_stderr=true
stdout_logfile=/home/vagrant/supervisor/$1-worker.log
"

echo "$block" > "/etc/supervisord.d/centsteadqueue-$1.ini"

systemctl restart supervisord.service