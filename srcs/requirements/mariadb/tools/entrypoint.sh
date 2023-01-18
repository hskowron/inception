#! /bin/bash

set -e

if [ ! -d /var/lib/mysql/$DB_NAME ]; then

service mysql start

mysql -u root -p << EoF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$PW';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE IF NOT EXISTS $DB_NAME;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$PW';
FLUSH PRIVILEGES;
EoF

mysqladmin -u root --password=$PW shutdown

fi

/usr/bin/mysqld_safe