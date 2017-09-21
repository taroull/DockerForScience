#
# https://docs.docker.com/engine/reference/builder/
#
#1.OS
FROM ubuntu:latest
LABEL maintainer="Sergio Martin Santana <sergio.ms.91@gmail.com>"

WORKDIR /install
#COPY install /install

#2.Base Apps
COPY /install/base .
RUN ./base

#2.Python
COPY /install/python .
RUN ./python

#3.Jupyter
WORKDIR /root/.jupyter/
COPY install/jupyter_notebook_config.py .
WORKDIR /install
COPY install/jupyter .
RUN ./jupyter

#X. Ports Exposed
EXPOSE 8888

#X. Clean Installation
WORKDIR /home
RUN rm -rf /install
