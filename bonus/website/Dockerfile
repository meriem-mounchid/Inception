FROM debian:buster

RUN apt-get update
RUN apt install -y vim git curl net-tools

WORKDIR /var/www/html/

RUN git clone https://github.com/meriem-mounchid/misaki-blog.git website

EXPOSE 1337