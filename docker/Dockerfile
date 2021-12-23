# my solvespace dockerfile to build and run the latest solvespace version

# install from latest ubuntu
FROM ubuntu:latest AS base_0

# update and upgrade libs
RUN apt-get update && \
    apt-get upgrade -y

# install tz_data
FROM base_0 as base_1

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

# locales
RUN apt-get install locales apt-utils
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

## preesed tzdata, update package index, upgrade packages and install needed software
RUN truncate -s0 /tmp/preseed.cfg && \
   (echo "tzdata tzdata/Areas select America" >> /tmp/preseed.cfg) && \
   (echo "tzdata tzdata/Zones/America select Los_Angeles" >> /tmp/preseed.cfg) && \
   debconf-set-selections /tmp/preseed.cfg && \
   rm -f /etc/timezone /etc/localtime && \
   apt-get install -y tzdata
## cleanup of files from setup
RUN rm -rf /tmp/*

# install solvespace deps
FROM base_1 as base_2

RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y cmake
RUN apt-get install -y zlib1g-dev libpng-dev
RUN apt-get install -y libcairo2-dev libfreetype6-dev libjson-c-dev
RUN apt-get install -y libfontconfig1-dev libgtkmm-3.0-dev libpangomm-1.4-dev
RUN apt-get install -y libgl-dev libglu-dev libspnav-dev 
