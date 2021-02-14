## Sonarr-Docker

---

Sonarr is a PVR for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new episodes of your favorite shows and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

## Getting Started

---

* [FAQ](https://wiki.servarr.com/Sonarr_FAQ)
* [Wiki](https://wiki.servarr.com/Sonarr)
* [(WIP) API Documentation](https://github.com/Sonarr/Sonarr/wiki/API)
* [Donate](https://sonarr.tv/donate)

## Bulding

```shell
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


```

##### [Official Sonarr GitHub Repository](https://github.com/Sonarr/Sonarr)
