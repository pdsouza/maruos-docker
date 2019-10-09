FROM debian:stretch

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
    openjdk-8-jdk

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
