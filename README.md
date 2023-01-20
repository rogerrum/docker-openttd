# Docker Image for OpenTTD

[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/rogerrum/docker-openttd?sort=semver)](https://hub.docker.com/r/rogerrum/docker-openttd/tags)
[![license](https://img.shields.io/github/license/rogerrum/docker-openttd)](https://github.com/rogerrum/docker-openttd/blob/main/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/rogerrum/docker-openttd.svg)](https://github.com/rogerrum/docker-openttd)
[![Contributors](https://img.shields.io/github/contributors/rogerrum/docker-openttd.svg)](https://github.com/rogerrum/docker-openttd/graphs/contributors)


A Docker image for **[OpenTTD](https://www.openttd.org/)** to run inside Docker container and access it remotely using web browser.

Repository name in ghcr.io: **[ghcr.io/rogerrum/docker-openttd](https://ghcr.io/rogerrum/docker-openttd)**  
Repository name in Docker Hub: **[rogerrum/docker-openttd](https://hub.docker.com/r/rogerrum/docker-openttd/)**  
Published via **automated build** mechanism  

## Docker Run
To simply do a quick and dirty run of the OpenTTD container:
```
docker run \
    -d --rm \
    --name openttd \
    -v=${pwd}/config:/config \
    --publish=3000:3000 \
     ghcr.io/rogerrum/docker-openttd:latest
  
```
Access the game in browser using the url
```
http://localhost:3000
```
To stop the container simply run:
```
$ docker stop openttd
```
To remove the container simply run:
```
$ docker rm openttd
```

## Docker Compose
If you don't want to type out these long **Docker** commands, you could
optionally use [docker-compose](https://docs.docker.com/compose/) to set up your
image. Just download the repo and run it like so:

```yaml
version: '3.8'
services:
  oscar:
    image: ghcr.io/rogerrum/docker-openttd:latest
    container_name: openttd
    restart: unless-stopped
    ports:
      - 3000:3000
    volumes:
      - ./config:/config:rw
```

## Issues
https://github.com/rogerrum/docker-openttd/issues

## Contribute
* I am happy for any feedback! Create issues, discussions, ... feel free and involve!
* Send me a PR
