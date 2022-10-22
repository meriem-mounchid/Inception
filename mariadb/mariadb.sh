#!/bin/sh

service mysql start
# mysql -u root < mariadb.sql

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE" 
mysql -u root -e "CREATE USER '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ROOT_USER'@'%'"
mysql -u root -e "USE $MYSQL_DATABASE"
mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'"
mysql -u root -e "FLUSH PRIVILEGES"

echo "Mariadb is Running.."
service mysql stop

mysqld_safe