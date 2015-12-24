#!/bin/bash

set -e

apt-get update

apt-get install -y --no-install-recommends mysql-server

mkdir -p /etc/service/mysql

cp /tmp/scripts/mysql.sh /etc/service/mysql/run
#cp /tmp/scripts/my-small.cnf /etc/mysql/my.cnf

rm -rf /var/lib/apt/lists/* /tmp/scripts

# Create root user

echo 'Starting mysqld'
# The sleep 1 is there to make sure that inotifywait starts up before the socket is created
mysqld_safe &

echo 'Waiting for mysqld to come online'
while [ ! -x /var/run/mysqld/mysqld.sock ]; do
    sleep 1
done

mysql <<-EOSQL
    DELETE FROM mysql.user ;
    CREATE USER 'root'@'%' IDENTIFIED BY 'pass' ;
    GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION ;
    FLUSH PRIVILEGES ;
EOSQL


echo 'Shutting down mysqld'
mysqladmin -uroot -ppass shutdown