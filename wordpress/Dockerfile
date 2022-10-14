# FROM wordpress
FROM debian:buster

RUN apt-get update
RUN apt-get install php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath unzip wget git -y

RUN mkdir -p /var/www/html/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN mv wordpress /var/www/html/wordpress
COPY ./wp-config.php /var/www/html/wordpress/wp-config.php

RUN chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R 755 /var/www/html/wordpress 

EXPOSE 9000

# docker run -it -p 80:80 --name mywp debian
# docker build -t wp .
# docker run -it -p 9000:9000 --name mywp wp

# apt-get install -y procps
# ps aux | grep nginx
# apt-get install net-tools
# netstat -tulpn | grep :80
# service --status-all
# docker run -it -p 80:80 --name mywp debian
# docker build -t wp .
# docker run -it -p 9000:9000 --name mywp nginx
