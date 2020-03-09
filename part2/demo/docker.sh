docker network create wordpress

docker run -d \
  --network wordpress \
  -p 80:80 \
  -p 8080:8080 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /Users/Sebastien/Hubic/Apside/Docker/Part2/demo/traefik.toml:/traefik.toml \
  -l "traefik.enable=false" \
  --name traefik \
  traefik:latest

docker run -d \
  --network wordpress \
  -e WORDPRESS_DB_PASSWORD=sybilByrdCursemedic \
  -v /Users/Sebastien/Hubic/Apside/Docker/Part2/demo/persistent/wordpress/server:/root/shared \
  -v /Users/Sebastien/Hubic/Apside/Docker/Part2/demo/persistent/wordpress/content:/var/www/html/wp-content \
  -l "traefik.backend=wordpress" \
  -l "traefik.frontend.rule=Host:wordpress.docker.localhost" \
  -- name wordpress \
  wordpress:latest

docker run -d \
  --network wordpress \
  -e MYSQL_ROOT_PASSWORD=sybilByrdCursemedic \
  -v /Users/Sebastien/Hubic/Apside/Docker/Part2/demo/persistent/wordpress/database:/var/lib/mysql
  -l "traefik.enable=false"
