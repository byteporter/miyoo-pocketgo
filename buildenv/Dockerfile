FROM debian:buster-slim

LABEL maintainer=docker@byteporter.com

ENV TOOLCHAIN_VERS=armv5-eabi--uclibc--bleeding-edge-2018.11-1

# Allows buildroot to run under root account
ENV FORCE_UNSAFE_CONFIGURE=1

RUN apt-get update

RUN apt-get install -y locales

RUN sed -i 's/^#.*\(en_US.UTF-8.*\)/\1/' /etc/locale.gen && locale-gen

ENV LANG=en_US.UTF-8

RUN apt-get install -y \
    build-essential \
    libncurses-dev \
    libssl-dev \
    python \
    python-dev \
    python3 \
    python3-dev \
    swig \
    kmod \
    bc \
    flex \
    bison \
    curl \
    wget \
    cpio \
    unzip \
    rsync \
    git \
    vim-tiny \
    distcc

WORKDIR /opt

RUN curl -LO https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/${TOOLCHAIN_VERS}.tar.bz2

RUN tar xfj ${TOOLCHAIN_VERS}.tar.bz2

ENV PATH ${PATH}:/opt/${TOOLCHAIN_VERS}/bin

WORKDIR /root

COPY Makefile .

CMD ["/bin/bash"]
