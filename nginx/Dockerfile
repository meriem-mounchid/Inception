FROM debian:10

RUN apt-get update
RUN apt-get install -y nginx
RUN mkdir -p /etc/nginx/certificate
COPY ./nginx.key /etc/nginx/certificate/nginx.key
COPY ./nginx-certificate.crt /etc/nginx/certificate/nginx-certificate.crt
RUN rm -f /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]