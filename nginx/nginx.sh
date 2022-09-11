#### Install Docker ####
sudo apt-get update
sudo apt-get install -y docker.io
sudo usermod -aG docker vagrant

#### Install Debian Conteiner ####
docker pull debian
docker run -it -p 0.0.0.0:443:443 --name mynginx debian
docker start NAME
docker exec -it NAME sh

#### Install VIM Nginx OpensSSL ####
apt-get update
apt-get install -y vim nginx
#apt-get install -y vim nginx openssl
# Backup:
# cp /etc/nginx/nginx.conf /etc/nginx/nginx.backup-tls
# vim /etc/nginx/nginx.conf
# Nginx configuration is valid:
nginx -t
service nginx reload
service nginx start
service nginx status
#p### Certif OpenSSL ####
mkdir /etc/nginx/certificate
touch /etc/nginx/certificate/nginx.key /etc/nginx/certificate/nginx-certificate.crt
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certificate/nginx.key -out /etc/nginx/certificate/nginx-certificate.crt
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certificate/nginx.key -out /etc/nginx/certificate/nginx-certificate.crt
#RUN openssl req -x509 -nodes -days 365 -subj "/C=MA/ST=KH/O=1337, Inc./CN=mmounchi.42.fr"  -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt;

vim /etc/nginx/sites-available/default
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
service nginx restart
# server_name  localhost;
#scp nginx.key nginx-certificate.crt default vagrant@10.12.100.83:~
docker build -t myapp .
docker run -p 443:443 -d --name mynginx myapp
# docker images
# docker ps -a
# docker rmi -fdocker run -p 443:443 -d --name mynginx myapp

# docker rm -f ID
docker rm -f $(docker ps -a -q)
docker rmi $(docker images -a -q)
### TEST ###
docker pull mysql
docker run -d mysql:latest
docker run -d -p 6379:6379 --name redis redis
docker run -d -p 6379:6379 --name redis -v /tmp/data:/data redis
# ==> ls /tmp/data/
docker run -d -p 0.0.0.0:80:80 mysql:latest
docker run -it --name sl mysql /bin/bash
docker start sl
docker ps # listed container
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
mkdir ~/compose-demo
cd ~/compose-demo
mkdir app
nano app/index.html

### END ###
   