FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim mariadb-server

# COPY ./mariadb.sql /
COPY ./mariadb.sh /

RUN sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's/#port                   = 3306/port                    = 3306/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /mariadb.sh

# RUN ./mariadb.sh

EXPOSE 3306

CMD ["./mariadb.sh"]
# CMD ["mysqld_safe"]

# To Build: docker build -t maria .
# To Run: docker run -it -p 3306:3306 --name myhubby maria
# vim /etc/mysql/mariadb.conf.d/50-server.cnf

# Install ps & MariaDB server is running
# apt-get update && apt-get install -y procps
# ps -ef | grep -i mysql
# apt-get install net-tools
# netstat -ant | grep 3306