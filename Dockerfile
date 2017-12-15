#OS
FROM ubuntu:latest
LABEL maintainer="Sergio Martin Santana <sergio.ms.91@gmail.com>"
WORKDIR /install

#1.Base Apps
COPY /install/base.sh .
RUN bash base.sh

#2.Python
RUN mkdir -p /notebooks/PyLibraries
COPY /install/python.sh .
RUN bash python.sh
COPY /install/custom_python.sh .
RUN bash custom_python.sh

#4. Spark
COPY install/spark.sh .
RUN bash spark.sh

#3.Jupyter
WORKDIR /root/.jupyter/
COPY install/jupyter_notebook_config.py .
WORKDIR /install
COPY install/jupyter.sh .
RUN bash jupyter.sh

#4.R
WORKDIR /notebooks/Rlibraries
WORKDIR /install
COPY install/R.sh .
RUN bash R.sh
COPY install/Rconfig.R .
RUN Rscript Rconfig.R

#5.RStudio
COPY install/RStudio.sh .
RUN bash RStudio.sh

#X. Ports Exposed
#Jupyter
EXPOSE 8888
#Spark
EXPOSE 8080 8081 7077
#RStudio
EXPOSE 8787

#X. Finishing Installation
COPY install/start.sh /etc/start.sh
COPY install/SparkConf.sh /etc/SparkConf.sh
WORKDIR /notebooks/PyLibraries
WORKDIR /install
WORKDIR /notebooks
RUN rm -rf /install
RUN locale-gen en_US.UTF-8
#RUN echo "R_LIBS='/notebooks/Rlibraries'" >> /usr/lib/R/etc/Renviron
#RUN echo "setwd('/notebooks')" >> /etc/R/Rprofile.site
ENV PIP_TARGET /notebooks/PyLibraries

ENTRYPOINT ["/etc/start.sh"]
