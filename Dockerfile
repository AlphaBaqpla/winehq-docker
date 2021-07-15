FROM ubuntu:groovy

RUN apt update && \
apt install -y wget software-properties-common && \
dpkg --add-architecture i386 && \
wget -nc https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key && \
add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ groovy main' && \
apt update && apt install winehq-stable -y && \
apt remove -y wget software-properties-common  && \
apt autoremove && \
apt clean