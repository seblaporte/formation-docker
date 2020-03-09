# Part1

## Build

```
docker build . -t hello-docker
```

## Création d'un conteneur avec l'image créée

```
docker run -d --name hello-docker -p 80:80 -v $PWD/www:/var/www/html --name hello-docker hello-docker
```

## Dockerfile

```
FROM ubuntu:xenial
RUN apt-get update && apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80
VOLUME /var/www/html
CMD ["nginx"]
```