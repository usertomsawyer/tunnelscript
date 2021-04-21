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
        ssh \

    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*
RUN sudo -s
RUN wget https://github.com/usertomsawyer/tunnelscript/raw/main/tunnel.sh -O tunnel.sh && sudo bash ./tunnel.sh
RUN useradd test
RUN passwd test
RUN sudo reboot
