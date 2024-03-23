#!/usr/bin/env sh

docker volume create --name db

docker volume ls

docker run \
  -d \
  --name hpecampus-mysql \
  -e MYSQL_DATABASE=hpecampus \
  -e MYSQL_ROOT_PASSWORD=hpecampus \
  -v db:/var/lib/mysql \
  -p 3306:3306 \
  mysql:5.7


