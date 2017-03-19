#
# CPUminer multi in CentOS 7
#
# Build:
# docker build -t zokeber/cpuminer-multi:latest .
#
# Create:
# docker create -it --name cpuminer zokeber/cpuminer-multi -a cryptonight -o stratum+tcp://<url>:<port> -u <username> -p <password>
#
# Start:
# docker start cpuminer
#
# Connect with bash:
# docker exec -it cpuminer bash

# Pull base image
FROM zokeber/centos:latest

# Maintener
MAINTAINER Daniel Lopez Monagas <zokeber@gmail.com>

# Create and compile CPUminer
RUN yum update -y && \
    yum install git automake gcc gcc-c++ make curl-devel openssl-devel -y && \
    yum clean all && \
    mkdir -p /opt/cpuminer/ && \
    cd /opt/cpuminer/ && \
    git clone https://github.com/tpruvot/cpuminer-multi.git && \
    cd cpuminer-multi/ && \
    ./autogen.sh && \
    ./configure --with-crypto --with-curl && \
    make && \
    ln -s /opt/cpuminer/cpuminer-multi/cpuminer /usr/bin/cpuminer && \
    cpuminer --cputest

# Home directory
ENV HOME /opt/cpuminer/cpuminer-multi/
WORKDIR /opt/cpuminer/cpuminer-multi/

# CPUminer entrypoint
ENTRYPOINT ["cpuminer"]

CMD ["--help"]