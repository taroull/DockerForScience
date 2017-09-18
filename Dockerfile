#1.OS
# Select OS, updating it and installing its base necessary apps
FROM ubuntu:latest
MAINTAINER Sergio Martin Santana <sergio.ms.91@gmail.com>
RUN apt-get update -y && apt-get install -y \
  wget \
  default-jre \
  tar \
  build-essential \
  && rm -rf /var/lib/apt/lists/*
