FROM ubuntu:20.04

LABEL       author="David Ignatenko" maintainer="alphabaqpla@outlook.com"

LABEL       org.opencontainers.image.source="https://github.com/AlphaBaqpla/winehq-docker"
LABEL       org.opencontainers.image.licenses=MIT


RUN apt update && \
apt install -y wget software-properties-common && \
dpkg --add-architecture i386 && \
wget -nc https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key && \
add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' && \
apt update && \
apt install winehq-stable -y && \
apt remove -y wget software-properties-common  && \
apt autoremove -y && \
apt clean

USER        container
ENV         USER=container HOME=/home/container
ENV         DEBIAN_FRONTEND noninteractive

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
