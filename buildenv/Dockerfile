FROM debian:stretch-slim

LABEL maintainer=docker@byteporter.com

ENV ARCH=armv5-eabi \
    LIBC=uclibc \
    VERSION=bleeding-edge-2018.11-1

RUN apt-get update

RUN apt-get install -y \
    build-essential \
    libncurses-dev \
    libssl-dev \
    bc \
    flex \
    bison \
    curl \
    vim-tiny

WORKDIR /opt

RUN curl -LO https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/${ARCH}--${LIBC}--${VERSION}.tar.bz2

RUN tar xfvj ${ARCH}--${LIBC}--${VERSION}.tar.bz2

ENV PATH ${PATH}:/opt/${ARCH}--${LIBC}--${VERSION}/bin

WORKDIR /root

CMD ["/bin/bash"]
