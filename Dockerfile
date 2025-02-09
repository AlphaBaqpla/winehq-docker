FROM ubuntu:20.04

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

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
