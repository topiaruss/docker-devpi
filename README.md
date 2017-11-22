## Devpi Dockerfile


This repository contains a **Dockerised** implementation of [Devpi](http://doc.devpi.net/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/scrapinghub/devpi/) published to the public [Docker Registry](https://index.docker.io/).

Thanks to [Stefano Apostolico](https://github.com/saxix) for the original. This fork updates the base platform to reduce the scary number of security issues, and adds a Concourse build pipeline, since that's the way my project is going for components and products.  I appreciate Stefano's attention to OS signal traps in the main entrypoint script. 

### Dependencies

* [A very recent library/python-on-ubuntu](https://hub.docker.com/_/python/)


### Installation

This image is specifically designed for deployment from Quay.io to K8s via my [Helm Chart](https://github.com/topiaruss/helm-devpi), and will be maintained with that purpose in mind, but it can also be used directly.

1. Install [Docker](https://www.docker.io/).

2. Download [the image](https://quay.io/repository/russf/docker-devpi?tab=tags):

  `docker pull quay.io/russf/docker-devpi`

   (alternatively, you can build an image from the Dockerfile: `docker build -t="russf/docker-devpi" github.com/topiaruss/docker-devpi`)


### Usage

#### Run `devpi-server`

    docker run -d --name devpi -p 3141:3141 -v /data/devpi_index:/mnt russf/docker-devpi

#### Create reusable container

    docker create --name devpi -p 3141:3141 -v /data/devpi_index:/mnt russf/docker-devpi

    docker start devpi


Devpi creates a user named `root` by default. Its password can be set with the
`DEVPI_PASSWORD` environment variable.
