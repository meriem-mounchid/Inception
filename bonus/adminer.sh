##### Adminer ######
docker run -it -p 0.0.0.0:3307:3307 --name myAdminer debian
# Getting Starteds
apt-get update -y
apt-get upgrade -y
apt-get install -y wget php 
# php-mysql
# test: which php
# mkdir /var/www /var/www/html
touch /var/www/html/adminer.php
wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer.php
chown -R www-data:www-data /var/www/html/adminer.php
chmod 755 /var/www/html/adminer.php
cp /var/www/html/adminer.php index.php
/usr/bin/php -S 0.0.0.0:3307
# /usr/bin/php -S 0.0.0.0:3307 -c /var/www/html/
# wget --save-headers superuser.com
