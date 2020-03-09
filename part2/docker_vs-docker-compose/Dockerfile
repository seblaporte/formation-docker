FROM ubuntu
RUN apt-get update && apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf 
CMD ["nginx"]
