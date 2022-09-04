FROM nvidia/cuda:11.5.1-devel-ubuntu18.04
LABEL Description="Build environment"

ENV HOME /root

SHELL ["/bin/bash", "-c"]
# Set timezone:
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone
RUN apt-get update && apt-get -y --no-install-recommends install \
    apt-utils \
    build-essential \
    clang \
    cmake \
    gdb \
    wget \
    libz-dev  \
    git \
    manpages-dev \
    vim \
    unzip \
    zip \
    curl
RUN apt-get update && apt-get install -y software-properties-common gcc && \
    add-apt-repository -y ppa:deadsnakes/ppa

RUN apt-get update && apt-get install -y manpages-dev python3.6 python3-distutils python3-pip python3-apt
#RUN wget https://developer.download.nvidia.com/compute/cuda/11.5.2/local_installers/cuda_11.5.2_495.29.05_linux.run; sudo sh cuda_11.5.2_495.29.05_linux.run --silent
