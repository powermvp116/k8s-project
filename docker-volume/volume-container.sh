#!/usr/bin/env sh

docker run \
  -d \
  -it \
  -v $(pwd)/html:/usr/share/nginx/html \
  --name web-volume \
  ubuntu:focal

docker run \
  -d \
  --name hpecampus-nginx \
  --volumes-from web-volume \
  -p 80:80 \
  nginx

docker run \
  -d \
  --name hpecampus-nginx2 \
  --volumes-from web-volume \
  -p 8080:80 \
  nginx


