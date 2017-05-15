# AOSP recommends 14.04
FROM ubuntu:14.04

MAINTAINER Preetam D'Souza <preetamjdsouza@gmail.com>

# AOSP dependencies https://source.android.com/source/initializing.html
RUN apt-get update && apt-get install -y \
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
    python

# kernel building dependencies
RUN apt-get install -y \
    bc

# workaround for OpenJDK8 on 14.04
RUN apt-get install -y wget \
&& wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openjdk-8/openjdk-8-jre-headless_8u45-b14-1_amd64.deb \
&& wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openjdk-8/openjdk-8-jre_8u45-b14-1_amd64.deb \
&& wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openjdk-8/openjdk-8-jdk_8u45-b14-1_amd64.deb \
&& echo "0f5aba8db39088283b51e00054813063173a4d8809f70033976f83e214ab56c0 openjdk-8-jre-headless_8u45-b14-1_amd64.deb" >> sha256sums.txt \
&& echo "9ef76c4562d39432b69baf6c18f199707c5c56a5b4566847df908b7d74e15849 openjdk-8-jre_8u45-b14-1_amd64.deb" >> sha256sums.txt \
&& echo "6e47215cf6205aa829e6a0a64985075bd29d1f428a4006a80c9db371c2fc3c4c openjdk-8-jdk_8u45-b14-1_amd64.deb" >> sha256sums.txt \
&& sha256sum -c sha256sums.txt \
&& dpkg -i *.deb ; apt-get -f install -y

# desktop image building dependencies
RUN apt-get install -y \
    binfmt-support \
    debootstrap \
    debian-archive-keyring \
    fakeroot \
    lxc \
    make \
    qemu \
    qemu-user-static

# LXC dependencies
RUN apt-get install -y \
    automake \
    pkg-config \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
