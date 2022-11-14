#!/bin/bash

if [ ! -d /run/php/ ]; then
  mkdir /run/php/
fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root

echo "Wordpress is Running.."

wp core install --title="Inception" --admin_user="root_misaki" --admin_password="root_misaki" --admin_email="mmounchi@student.1337.ma" --url="https://localhost" --allow-root
wp user create "misaki_user" "misaki@gmail.com" --user_pass="misaki" --allow-root
wp plugin install redis-cache --activate --allow-root
wp redis enable --force --allow-root

/usr/sbin/php-fpm7.3 -F -R
