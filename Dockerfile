# CAMBIAR TODO A INSTALL NO ETC
# CAMBIAR TODO A INSTALL NO ETC

#OS
FROM ubuntu:latest
LABEL maintainer="Sergio Martin Santana <sergio.ms.91@gmail.com>"
WORKDIR /install

#1.Base Apps
COPY /install/base.sh .
RUN bash base.sh

#2.Python
# RUN mkdir -p /notebooks/PyLibraries
COPY /install/python.sh .
RUN echo "---------------------------------------" && \
    echo "Installing Python in data science stack" && \
    echo "---------------------------------------" && \
    bash python.sh
COPY install/custom_python.sh .
COPY install/PyLibraries.sh .
#RUN bash custom_python.sh

#4.R
#WORKDIR /notebooks/Rlibraries
#RUN mkdir -p /notebooks/Rlibraries
#WORKDIR /install
COPY install/R.sh .
RUN bash R.sh
COPY install/Rconfig.R .
#RUN Rscript Rconfig.R

#5.RStudio
COPY install/RStudio.sh .
RUN bash RStudio.sh

#4. Spark
COPY install/spark.sh .
RUN bash spark.sh
COPY install/SparkConf.sh /install/SparkConf.sh
# ENV SPARK_HOME /opt/spark
# ENV PYTHONPATH $SPARK_HOME/python/:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$SPARK_HOME/python/lib/pyspark.zip:$PYTHONPATH
# ENV PATH=$PATH:$SPARK_HOME/bin
#echo "export SPARK_HOME=/opt/spark" >> ~/.bashrc
#echo "export PYTHONPATH=\$SPARK_HOME/python/:\$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:\$SPARK_HOME/python/lib/pyspark.zip:\$PYTHONPATH" >> ~/.bashrc
#echo "export PATH=\$PATH:\$SPARK_HOME/bin" >> ~/.bashrc

#3.Jupyter
#WORKDIR /root/.jupyter/
COPY install/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
#WORKDIR /install
COPY install/jupyter.sh .
RUN bash jupyter.sh
#ENV PIP_TARGET /notebooks/PyLibraries

#X. Ports Exposed
#Jupyter
EXPOSE 8888
#Spark
EXPOSE 8080 8081 7077
#RStudio
EXPOSE 8787

#X. Finishing Installation
COPY install/start.sh /install/start.sh

#WORKDIR /notebooks/PyLibraries
#WORKDIR /install

#RUN rm -rf /install
#RUN locale-gen en_US.UTF-8
#RUN echo "R_LIBS='/notebooks/Rlibraries'" >> /usr/lib/R/etc/Renviron
#RUN echo "setwd('/notebooks')" >> /etc/R/Rprofile.site
#ENV PIP_TARGET /notebooks/PyLibraries
# COPY install/bar /usr/bin/bar
# COPY install/launch.sh /install/launch.sh
WORKDIR /notebooks
ENTRYPOINT ["/install/start.sh"]
