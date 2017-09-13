## Devpi Dockerfile


This repository contains **Dockerfile** of [Devpi](http://doc.devpi.net/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/scrapinghub/devpi/) published to the public [Docker Registry](https://index.docker.io/).


### Dependencies

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/saxix/devpi/) from public [Docker Registry](https://index.docker.io/): `docker pull saxix/devpi`

   (alternatively, you can build an image from Dockerfile: `docker build -t="saxix/devpi" github.com/saxix/docker-devpi`)


### Usage

#### Run `devpi-server`

    docker run -d --name devpi -p 3141:3141 --mount source=/data/xxx,target=/mnt  saxix/devpi

#### Create reusable container

    docker create --name devpi -p 3141:3141 -v /data/devpi_index:/mnt  saxix/devpi

    docker start devpi


Devpi creates a user named `root` by default, its password can be set with
`DEVPI_PASSWORD` environment variable.
