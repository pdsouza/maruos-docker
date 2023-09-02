FROM debian:buster

# AOSP dependencies https://source.android.com/source/initializing.html
RUN apt-get update && apt-get -q -y install \
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
    libncurses5 \
    x11proto-core-dev \
    libx11-dev \
    lib32z-dev \
    liblz4-tool \
    ccache \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    python \
    openjdk-11-jdk

# OpenJDK 8 is not available in buster so install from AOSP
# Based on https://android.googlesource.com/platform/build/+/master/tools/docker/Dockerfile
RUN curl -o jdk8.tgz https://android.googlesource.com/platform/prebuilts/jdk/jdk8/+archive/master.tar.gz \
 && tar -zxf jdk8.tgz linux-x86 \
 && mv linux-x86 /usr/lib/jvm/java-8-openjdk-amd64 \
 && rm -rf jdk8.tgz

# missing dependencies in base image
RUN apt-get -q -y install \
    procps

# kernel building dependencies
RUN apt-get -q -y install \
    bc

# Google Pixel (sailfish) dependencies
RUN apt-get -q -y install \
    bsdmainutils # hexdump is required for generating OTA

# desktop image building dependencies
RUN apt-get -q -y install \
    binfmt-support \
    debootstrap \
    debian-archive-keyring \
    fakeroot \
    lxc \
    make \
    qemu \
    qemu-user-static

# LXC dependencies
RUN apt-get -q -y install \
    automake \
    pkg-config \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
