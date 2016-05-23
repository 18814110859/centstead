#!/usr/bin/env bash

yum remove -y mariadb mariadb-server mariadb-client mariadb-devel mariadb-common
yum remove -y mysql mysql-server mysql-client mysql-devel mysql-common

rm -rf /var/lib/mysql/
rm -rf /var/log/mysqld.log