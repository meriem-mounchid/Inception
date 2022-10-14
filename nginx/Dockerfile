# FROM nginx
FROM debian:buster

RUN apt-get update
RUN apt-get install -y vim nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/selfsigned-nginx.key -out /etc/ssl/certs/selfsigned-nginx.crt -subj "/C=MA/ST=CASABLANCA-SETTAT/L=Khouribga/O=Misaki Ltd./OU=IT/CN=mmounchi.42.fr"
RUN apt-get install php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath unzip wget git -y

RUN rm -f /etc/nginx/sites-available/default
RUN rm -f /etc/nginx/sites-enabled/default
COPY ./nginx.conf /etc/nginx/sites-enabled/nginx.conf
RUN ln -s /etc/nginx/sites-enabled/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN nginx -t
RUN service nginx start

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

# docker run -it -p 443:443 --name mynginx debian
# docker build -t nginx .
# docker run -it -p 80:80 --name mynginx nginx

# apt-get install -y procps
# ps aux | grep nginx
# apt-get install net-tools
# netstat -tulpn | grep :80
# service --status-all
