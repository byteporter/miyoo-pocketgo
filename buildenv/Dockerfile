FROM debian:stretch-slim

LABEL maintainer=docker@byteporter.com

RUN apt-get update

RUN apt-get install -y \
    build-essential \
    && curl \
    

RUN mkdir -p /usr/local/armv5-eabi

RUN curl -sLO https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2018.11-1.tar.bz2 
