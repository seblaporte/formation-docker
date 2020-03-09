FROM ubuntu:xenial
RUN apt-get update && apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80
VOLUME /var/www/html
CMD ["nginx"]
