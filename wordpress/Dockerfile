# FROM wordpress
FROM debian:buster

RUN apt-get update
# RUN apt-get install php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath unzip wget git -y
RUN apt-get install php-cgi php-fpm php-mysql curl wget git -y

RUN mkdir -p /var/www/html/

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp
# RUN mkdir -p /usr/local/bin/wp
# RUN touch /usr/local/bin/wp/php
# RUN chmod +x /usr/local/bin/wp/php

# RUN chown -R www-data:www-data *
# RUN chmod 755 {dir}
# RUN chmod 644 {files}


RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN mv wordpress /var/www/html/wordpress
COPY ./wp-config.php /var/www/html/wordpress/wp-config.php
COPY ./script.sh /
RUN rm /etc/php/7.3/fpm/pool.d/www.conf
COPY ./www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 777 script.sh
RUN chmod 777 /etc/php/7.3/fpm/pool.d/www.conf
# RUN wp core install --title="Inception" --admin_user="wp" --admin_password="1234" --admin_email="ouseqqam@student.1337.ma" --url="https://localhost" --allow-root
# wp user create "wpd" "t@gmail.com" --user_pass="1234" --allow-root

# RUN sh script.sh
EXPOSE 9000
CMD ["./script.sh"]

# apt-get install -y procps net-tools vim
# ps aux | grep nginx
# apt-get install net-tools
# netstat -pltn | grep 9000
# service --status-all