# FROM mariadb

FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

# ENV MYSQL_ROOT_PASSWORD=Promisaki
# ENV MYSQL_PASSWORD=misaki
# ENV MYSQL_USER=misaki_user
# ENV MYSQL_DATABASE=misaki_db

# VOLUME /Users/mmounchi/data/
# mysql -uroot < data.sql
EXPOSE 3306
# mysql -uroot 'create database $'
CMD ["mysqld_safe"]