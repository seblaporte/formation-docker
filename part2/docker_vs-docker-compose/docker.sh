docker build . -t hello-docker

docker run -d \
	--name hello-docker \
	-p 80:80 \
	-v /Users/Sebastien/Hubic/Apside/Docker/Part2/docker_vs-docker-compose/www:/var/www/html \
	--name hello-docker \
	hello-docker