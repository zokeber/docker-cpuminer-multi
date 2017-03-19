# CPUminer multi in CentOS 7

This repository contains a Dockerfile to build a Docker Image for [CPUminer Multi](https://github.com/tpruvot/cpuminer-multi) in CentOS 7

[![Build Status](https://travis-ci.org/zokeber/docker-cpuminer-multi.svg?branch=master)](https://travis-ci.org/zokeber/docker-cpuminer-multi)

## Base Docker Image

* [zokeber/centos](https://registry.hub.docker.com/u/zokeber/centos/)

## Usage

### Installation

1. Install [Docker](https://www.docker.com/).

2. You can download automated build from public Docker Hub Registry:

``` docker pull zokeber/cpuminer-multi:latest ```

**Another way: build from Github**

To create the image zokeber/cpuminer-multi, clone this repository and execute the following command on the docker-cpuminer-multi folder:

`docker build -t zokeber/cpuminer-multi:latest .`

Another alternatively, you can build an image directly from Github:

`docker build -t="zokeber/cpuminer-multi:latest" github.com/zokeber/docker-cpuminer-multi`

### Create and running a container

**Create container:**

``` docker create -it --name cpuminer zokeber/cpuminer-multi -a cryptonight -o stratum+tcp://<url>:<port> -u <username> -p <password>```

**Start container:**

``` docker start cpuminer ```

**Another way to start a cpuminer-multi container:**

``` docker run -d --name cpuminer zokeber/cpuminer-multi -a cryptonight -o stratum+tcp://<url>:<port> -u <username> -p <password>```

**Show cpuminer settings:**

```docker exec -it cpuminer-multi cpuminer --help``` 

### Connection methods:

**Bash:**

`docker exec -it cpuminer-multi bash`

### Upgrading

Update the docker image:

``` docker pull zokeber/postgresql:latest ```