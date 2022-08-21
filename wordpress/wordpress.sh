#### Install Debian DC ####
docker run -it -p 0.0.0.0:9000:9000 --name myWordpress debian

#### Install Nginx ####
service nginx restart
#### Install MariaDB #### 
service mariadb start
vim /var/www/html/wordpress/wp-config.php

#### Install PHP ####
apt update && apt upgrade
apt install -y wget php-cli php-fpm php-mysql php-json php-opcache php-mbstring php-xml php-gd php-curl
php -v
service php7.4-fpm start
service php7.4-fpm status

#### Install WP ####
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
mkdir /var/www/html/wordpress
cp -a /tmp/wordpress/. /var/www/html/wordpress/
chown -R www-data:www-data /var/www/html/wordpress/
vim /etc/nginx/sites-available/default

vim /etc/nginx/sites-available/wordpress.conf
server {
        listen 443 ssl default_server;
        listen [::]:443 ssl default_server;
        ssl_certificate /etc/nginx/certificate/nginx-certificate.crt;
        ssl_certificate_key /etc/nginx/certificate/nginx.key;
        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_prefer_server_ciphers off;
        ssl_ciphers "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-SHA";
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        server_name _;
        location / {
                try_files $uri $uri/ =404;
        }
}
server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html/wordpress;
        index index.php index.html index.htm;
        server_name localhost;

        access_log /var/log/nginx/wordpress_access.log;
        error_log /var/log/nginx/wordpress_error.log;
        client_max_body_size 64M;
        location / {
                try_files $uri $uri/ /index.php?$args;
                }
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/run/php/php7.4-fpm.sock;
                fastcgi_param   SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
}
rm /etc/nginx/sites-available/default
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/
nginx -t
service nginx restart
