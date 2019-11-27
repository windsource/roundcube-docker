![](https://github.com/windsource/roundcube-docker/workflows/Roundcube%20docker%20image/badge.svg)
[![Docker Pulls](https://img.shields.io/docker/pulls/windsource/roundcube.svg)](https://hub.docker.com/r/windsource/roundcube/)

# Docker image for Roundcube Webmail with additional plugins

## Introduction

Contains a docker image for [Roundcube Webmail](https://roundcube.net/). It also contains some additional plugins:

* roundcube/carddav
* kitist/html5_notifier
* mfreiholz/persistent_login

The image is not based on the [original Roundcube docker image](https://github.com/roundcube/roundcubemail-docker) as this was missing the composer to add additional plugins and that could not be added easily.

The image is also available on [Docker Hub](https://hub.docker.com/r/windsource/roundcube).

Currently the mail servers from GMX are configured. That can be changed in `config.inc.php`.

## Use the image

```bash
docker run -d -p 8000:80 windsource/roundcube
```

## Build image

```bash
make build
```
