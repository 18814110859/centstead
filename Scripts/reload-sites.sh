#!/usr/bin/env bash

sudo systemctl restart nginx.service
sudo systemctl restart php-fpm.service
#sudo systemctl restart hhvm.service