FROM debian:buster

RUN apt-get update
RUN apt-get install php-fpm php-mysql curl wget git -y

WORKDIR /var/www/html/wordpress

COPY ./script.sh /
COPY ./wp-config.php /var/www/html/wordpress/wp-config.php
RUN rm /etc/php/7.3/fpm/pool.d/www.conf
COPY ./www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 777 /script.sh
RUN chmod 777 /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000
CMD ["/script.sh"]