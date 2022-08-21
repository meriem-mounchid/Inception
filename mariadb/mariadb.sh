#### Creat Debian Container ####
docker run -it -p 3306:3306 -v /Users/mmounchi/data/ --name myMariaDB debian
docker run -it -p 3306:3306 -v /Users/mmounchi/data/ --name myMariaDB maria

#### Install MariaDB ####
apt-get update
apt-get install -y mariadb-server

service mariadb start
mariadb
CREATE DATABASE wordpress;
# show databases;
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
CREATE USER 'master'@localhost IDENTIFIED BY 'master';
CREATE USER 'master'@'%' IDENTIFIED BY 'master';
GRANT ALL PRIVILEGES ON wordpress.* TO 'master'@localhost;
CREATE USER 'worker'@localhost IDENTIFIED BY 'worker'; 

# Save Changes
FLUSH PRIVILEGES;
# See details: SHOW GRANTS FOR 'master'@localhost;
# Delet User: DROP USER myuser@localhost;
# See All Users: select user from mysql.user;
# Connect: mysql -u NAME -p

# ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('root');
# docker inspect MyMariaDB | grep -C3 -e "Volumes\":"
%
volume
root PASSWORD