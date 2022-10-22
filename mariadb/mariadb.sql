CREATE DATABASE IF NOT EXISTS misaki_db;
CREATE USER 'root_misaki'@'%' IDENTIFIED BY 'root_misaki';
GRANT ALL PRIVILEGES ON *.* TO 'root_misaki'@'%';
USE misaki_db;
CREATE USER 'misaki_user'@'%' IDENTIFIED BY 'misaki';
GRANT ALL PRIVILEGES ON misaki_db.* TO 'misaki_user'@'%';
FLUSH PRIVILEGES;

-- CREATE DATABASE IF NOT EXISTS '{$MYSQL_DATABASE}';
-- CREATE USER '{$MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '{$MYSQL_ROOT_PASSWORD}';
-- GRANT ALL PRIVILEGES ON *.* TO '{$MYSQL_ROOT_USER}'@'%';
-- USE misaki_db;
-- CREATE USER '{$MYSQL_USER}'@'%' IDENTIFIED BY '{$MYSQL_PASSWORD}';
-- GRANT ALL PRIVILEGES ON misaki_db.* TO '{$MYSQL_USER}'@'%';
-- FLUSH PRIVILEGES;




-- Reload the grant tables into memory without reloading or restarting mysql service.
-- See details: SHOW GRANTS FOR 'master'@localhost;
-- Delet User: DROP USER myuser@localhost;
-- See All Users: select user from mysql.user;
-- Connect: mysql -u NAME -p

-- ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('root');
-- docker inspect MyMariaDB | grep -C3 -e "Volumes\":"
