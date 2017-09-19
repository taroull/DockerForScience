#
# https://docs.docker.com/engine/reference/builder/
#
#1.OS
# Select OS, updating it and installing its base necessary apps
FROM ubuntu:latest
LABEL maintainer="Sergio Martin Santana <sergio.ms.91@gmail.com>"

WORKDIR /install
COPY /install/base .
RUN ./base

#2.Python
COPY /install/python .
RUN ./python
