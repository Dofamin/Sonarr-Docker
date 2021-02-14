#!/bin/bash
git clone https://github.com/Dofamin/Sonarr-Docker.git /srv/Sonarr/

docker build /srv/Sonarr/ --tag sonarr 

docker rm --force Sonarr

docker create \
  --name=Sonarr \
  -p 8989:8989/tcp \
  -p 8989:8989/udp \
  -v /srv/Sonarr/container-image-root/data/:/Sonarr/data\
  --restart unless-stopped \
  sonarr:latest

docker start Sonarr
