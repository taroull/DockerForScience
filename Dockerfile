#OS
FROM ubuntu:latest
LABEL maintainer="Sergio Martin Santana <sergio.ms.91@gmail.com>"
WORKDIR /install

#1.Base Apps
COPY /install/base.sh .
RUN echo "---------------------------------------" && \
    echo "Installing Base Apps in data science stack" && \
    echo "---------------------------------------" && \
    bash base.sh

#2.Python
COPY /install/python.sh .
RUN echo "---------------------------------------" && \
    echo "Installing Python in data science stack" && \
    echo "---------------------------------------" && \
    bash python.sh
COPY install/custom_python.sh .
COPY install/PyLibraries.sh .

#4.R
COPY install/R.sh .
RUN echo "---------------------------------------" && \
    echo "Installing R in data science stack" && \
    echo "---------------------------------------" && \
    bash R.sh
COPY install/Rconfig.R .

#5.RStudio
COPY install/RStudio.sh .
RUN echo "---------------------------------------" && \
    echo "Installing Rstudio in data science stack" && \
    echo "---------------------------------------" && \
    bash RStudio.sh

#4. Spark
COPY install/spark.sh .
RUN echo "---------------------------------------" && \
    echo "Installing Spark in data science stack" && \
    echo "---------------------------------------" && \
    bash spark.sh
COPY install/SparkConf.sh /install/SparkConf.sh

#3.Jupyter
COPY install/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
COPY install/jupyter.sh .
RUN echo "---------------------------------------" && \
    echo "Installing Jupyter in data science stack" && \
    echo "---------------------------------------" && \bash jupyter.sh

#X. Finishing instalation and additional configuration of data science applications
#Jupyter
EXPOSE 8888
#Spark
EXPOSE 8080 8081 7077
#RStudio
EXPOSE 8787

COPY install/start.sh /install/start.sh
WORKDIR /notebooks
RUN echo "---------------------------------------" && \
    echo "Finishing build data science system" && \
    echo "---------------------------------------"
ENTRYPOINT ["/install/start.sh"]
