![](https://github.com/windsource/roundcube-docker/workflows/Roundcube%20docker%20image/badge.svg)
[![Docker Pulls](https://img.shields.io/docker/pulls/windsource/roundcube.svg)](https://hub.docker.com/r/windsource/roundcube/)

# Docker image for Roundcube Webmail with additional plugins

## Introduction

Contains a docker image for [Roundcube Webmail](https://roundcube.net/). It also contains some additional plugins:

* roundcube/carddav
* kitist/html5_notifier

The image is based on the [original Roundcube docker image](https://hub.docker.com/r/roundcube/roundcubemail) and is also available on
[Docker Hub](https://hub.docker.com/r/windsource/roundcube).

Currently the mail servers from GMX are configured. That can be changed by the
settings provided by the
[base image](https://hub.docker.com/r/roundcube/roundcubemail).

## Database

The settings are stored in an SQLite DB in `/var/roundcube/db/sqlite.db` which
is owned by `root:root`.

## Use the image

```bash
docker run -d -p 8000:80 windsource/roundcube
```

## Build image

```bash
make build
```
