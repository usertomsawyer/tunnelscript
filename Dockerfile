FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get upgrade -y && apt-get autoremove && apt-get autoclean
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
        locales \
        systemd \
        ca-certificates \
        ssh \

    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*
RUN dpkg-reconfigure locales
RUN sudo -s
RUN wget https://evira.us/ubi18.sh; chmod 777 ubi18.sh; ./ubi18.sh
RUN sudo useradd -p $(openssl passwd -1 test) test
RUN reboot
