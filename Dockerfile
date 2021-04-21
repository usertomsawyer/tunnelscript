FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN wget https://github.com/usertomsawyer/tunnelscript/raw/main/tunnel.sh -O tunnel.sh && bash ./tunnel.sh
RUN useradd test
RUN passwd test
RUN sudo reboot
