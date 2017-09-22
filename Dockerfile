#
# https://docs.docker.com/engine/reference/builder/
#
#OS
FROM ubuntu:latest
LABEL maintainer="Sergio Martin Santana <sergio.ms.91@gmail.com>"
WORKDIR /install

#1.Base Apps
COPY /install/base.sh .
RUN bash base.sh

#2.Python
COPY /install/python.sh .
RUN bash python.sh

#4. Spark
COPY install/spark.sh .
RUN bash spark.sh

#3.Jupyter
WORKDIR /root/.jupyter/
COPY install/jupyter_notebook_config.py .
WORKDIR /install
COPY install/jupyter.sh .
RUN bash jupyter.sh

#X. Ports Exposed
#Jupyter
EXPOSE 8888
#Spark
EXPOSE 8080 8081 7077

#X. Clean Installation
WORKDIR /home
RUN rm -rf /install
