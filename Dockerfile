#1.OS
# Select OS, updating it and installing its base necessary apps
FROM ubuntu:latest
LABEL maintainer="Sergio Martin Santana <sergio.ms.91@gmail.com>"
RUN apt-get update -y && apt-get install -y \
  wget \
  default-jre \
  tar \
  build-essential \
  apt-utils \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /install
RUN apt-get update -y && apt-get install -y vim

#2.Python
COPY /install/python .
RUN ./python
