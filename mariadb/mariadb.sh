#### Creat Debian Container ####
docker pull debian
docker run -it -p 3306:3306 --name mymariadb debian
docker run -it -p 3306:3306 -v /Users/mmounchi/data/ --name myMariaDB maria

#### Install MariaDB ####
apt-get update
apt-get install -y mariadb-server vim 


# export NAME=VALUE

export MYSQL_ROOT_PASSWORD=root_misaki
export MYSQL_PASSWORD=misaki
export MYSQL_USER=misaki_user
export MYSQL_DATABASE=misaki_db

service mariadb start
# RUN /etc/init.d/mariadb start
mariadb
CREATE DATABASE misaki_db;
# RUN mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE misaki_db"
# RUN mysql -u root -p${MYSQL_ROOT_PASSWORD} -D lba < /usr/sql/sources.sql


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
