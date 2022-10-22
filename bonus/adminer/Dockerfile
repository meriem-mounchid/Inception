# FROM adminer

FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget vim apache2 php libapache2-mod-php php-curl php-cli php-mysql php-gd -y
# RUN service apache2 startz
# RUN service mariadb start
COPY ./script.sh /

RUN chmod +x /script.sh
RUN sh script.sh
RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php
RUN chown -R www-data:www-data /var/www/html/adminer.php
RUN chmod 755 /var/www/html/adminer.php
# RUN cp /var/www/html/adminer.php index.php
# RUN sh script.sh
# docker build -t adminer .
# docker run -it -p 8080:8080 --name myAdminer debian
# docker start myAdminer
# docker exec -it myAdminer /bin/bash
# service --status-all

CMD ["/usr/bin/php", "-S", "0.0.0.0:8080", "/var/www/html/adminer.php"]