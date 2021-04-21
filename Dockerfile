FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get upgrade
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        expect \
        sudo \
        vim \
        bash \
        net-tools \
        curl \
        git \
        wget \
        openssl \
        ssh \

    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*
RUN dpkg-reconfigure locales
RUN sudo -s
RUN sudo timedatectl set-timezone Asia/Colombo
ADD tunnel.sh /tunnel.sh
RUN sudo bash ./tunnel.sh
RUN sudo useradd -p $(openssl passwd -1 test) test
