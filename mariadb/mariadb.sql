-- GRANT ALL PRIVILEGES ON *.* TO 'misaki_user'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
CREATE USER 'master'@localhost IDENTIFIED BY 'master';
CREATE USER 'master'@'%' IDENTIFIED BY 'master';
GRANT ALL PRIVILEGES ON misaki_db.* TO 'master'@localhost;
CREATE USER 'worker'@localhost IDENTIFIED BY 'worker';

-- grant all privileges on misaki_db.* to 'misaki_user'@localhost IDENTIFIED BY 'mypassword';

-- USE misaki_db;
-- CREATE TABLE Students(  
-- student_id INT NOT NULL AUTO_INCREMENT,  
-- student_name VARCHAR(100) NOT NULL,  
-- student_address VARCHAR(40) NOT NULL,  
-- admission_date DATE,  
-- PRIMARY KEY ( student_id ));  

FLUSH PRIVILEGES;
-- sudo apt-get purge -y mariadb-server 
-- SHOW tables;
