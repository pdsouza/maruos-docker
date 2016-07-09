# AOSP recommends 14.04
FROM ubuntu:14.04

MAINTAINER Preetam D'Souza <preetamjdsouza@gmail.com>

# AOSP dependencies https://source.android.com/source/initializing.html
RUN apt-get -y update && apt-get install -y \
    git-core \
    gnupg \
    flex \
    bison \
    gperf \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z-dev \
    ccache \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    python \
    openjdk-7-jdk

# desktop image building dependencies
RUN apt-get update && apt-get install -y \
    binfmt-support \
    debootstrap \
    debian-archive-keyring \
    fakeroot \
    lxc \
    make \
    qemu \
    qemu-user-static

# LXC dependencies
RUN apt-get -y update && apt-get install -y \
    automake \
    pkg-config \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
