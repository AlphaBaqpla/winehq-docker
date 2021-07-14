FROM ubuntu:groovy

RUN apt update
RUN apt install -y wget software-properties-common
RUN dpkg --add-architecture i386
RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key
RUN add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ groovy main'
RUN apt update && apt install --install-recommends winehq-stable -y

ENTRYPOINT [ "/bin/bash" ]