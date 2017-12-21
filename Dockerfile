#OS
FROM ubuntu:latest
LABEL maintainer="Sergio Martin Santana <sergio.ms.91@gmail.com>"

#1.Linux system libraries
#add-apt-repository ppa:openjdk-r/ppa && \

RUN apt-get -y update && \
    apt-get install -y apt-utils wget tar vim locales software-properties-common apt-transport-https ca-certificates python-software-properties libcurl4-openssl-dev libssl-dev && \
    apt-get install -y openjdk-8-jdk && \
    #add-apt-repository ppa:openjdk-r/ppa && \
    rm -rf /var/lib/apt/lists/* 

#2.Install data science stack applications
RUN echo "---------------------------------------" && \
    echo "Installing Python in data science stack" && \
    echo "---------------------------------------" && \
    apt-get -y update && \
    apt-get -y install python python-dev python-pip && \
    apt-get -y update && \
    apt-get -y install python3 python3-dev python3-pip && \
    python -m pip install --upgrade pip && \
    python3 -m pip install --upgrade pip && \
    echo "---------------------------------------" && \
    echo "Installing Spark in data science stack" && \
    echo "---------------------------------------" && \
    SPARK_VER="2.2.0"  && \
    HADOOP_VER="2.7"  && \
    SPARK_DIST="spark-$SPARK_VER-bin-hadoop$HADOOP_VER"  && \
    SPARK_URL="https://d3kbcqa49mib13.cloudfront.net/$SPARK_DIST.tgz"  && \
    INSTALL_DIR="/opt"  && \
    wget -P /tmp -c ${SPARK_URL} && \
    tar xzvf /tmp/${SPARK_DIST}.tgz -C ${INSTALL_DIR} && \
    mv /opt/spark-${SPARK_VER}-bin-hadoop${HADOOP_VER}/ /opt/spark && \
    rm /tmp/${SPARK_DIST}.tgz && \
    ln -s /opt/spark-${SPARK_VER} /opt/spark  && \
    echo "---------------------------------------" && \
    echo "Installing Jupyter in data science stack" && \
    echo "---------------------------------------" && \
    pip install --upgrade pip && pip install jupyter && \
    python -m pip install ipykernel && python -m ipykernel install --user && \
    python3 -m pip install ipykernel && python3 -m ipykernel install --user && \
    echo "---------------------------------------" && \
    echo "Installing R in data science stack     " && \
    echo "---------------------------------------" && \
    R_ARCH='amd64' && \
    R_SO_VER='xenial/' && \
    R_REPO='https://cran.rstudio.com/bin/linux/ubuntu' && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9  && \
    add-apt-repository "deb [arch=$R_ARCH] $R_REPO $R_SO_VER"  && \
    apt-get update -y && apt-get install -y r-base && \
    echo "---------------------------------------" && \
    echo "Installing R-studio in data science stack" && \
    echo "---------------------------------------" && \
    RS_VER="1.0.153" && \
    RS_ARCH="amd64" && \
    apt-get install -y gdebi-core && \
    wget "https://download2.rstudio.org/rstudio-server-${RS_VER}-${RS_ARCH}.deb" && \
    gdebi -n rstudio-server-1.0.153-amd64.deb && \
    ln -s /usr/lib/rstudio-server/extras/init.d/debian/rstudio-server /etc/init.d/rstudio-server


#3. Configure ports of web applications
#Jupyter
EXPOSE 8888
#Spark
EXPOSE 8080 8081 7077
#RStudio
EXPOSE 8787


#4. Configure data science stack applications

#ENV PIP_TARGET /notebooks/PyLibraries
#ENV SPARK_HOME /opt/spark
#ENV PYTHONPATH ${SPARK_HOME}/python/:${SPARK_HOME}/python/lib/py4j-0.10.4-src.zip:${SPARK_HOME}/python/lib/pyspark.zip:${PIP_TARGET}


RUN mkdir -p /install && \
    echo "---------------------------------------" && \
    echo "Setting up Python in data science stack" && \
    echo "---------------------------------------" && \
    PIP_TARGET=/notebooks/PyLibraries && \
    mkdir -p /notebooks/PyLibraries && \ 
    mkdir -p ~/.pip && \ 
    printf "[global]\ntarget=${PIP_TARGET}" >> ~/.pip/pip.conf && \     
    echo "export PIP_TARGET=${PIP_TARGET}" >> ~/.bashrc && \
    echo "export PIP_TARGET=${PIP_TARGET}" > /install/envs_config.sh && \
    echo "---------------------------------------" && \
    echo "Setting up Spark in data science stack" && \
    echo "---------------------------------------" && \
    SPARK_HOME=/opt/spark && \
    echo "export SPARK_HOME=${SPARK_HOME}" >> ~/.bashrc && \
    echo "export PYTHONPATH=\$SPARK_HOME/python/:\$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:\$SPARK_HOME/python/lib/pyspark.zip:\$PIP_TARGET:\$PYTHONPATH" >> ~/.bashrc && \
    echo "export PATH=\$PATH:\$SPARK_HOME/bin" >> ~/.bashrc && \
    echo "export SPARK_HOME=${SPARK_HOME}" >> /install/envs_config.sh && \
    echo "export PYTHONPATH=\$SPARK_HOME/python/:\$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:\$SPARK_HOME/python/lib/pyspark.zip:\$PIP_TARGET:\$PYTHONPATH" >> /install/envs_config.sh && \
    echo "export PATH=\$PATH:\$SPARK_HOME/bin" >> /install/envs_config.sh && \    
    echo "---------------------------------------" && \
    echo "Setting up Jupyter in data science stack" && \
    echo "---------------------------------------" && \
    echo "---------------------------------------" && \
    echo "Setting up R in data science stack" && \
    echo "---------------------------------------" && \
    mkdir -p /notebooks/Rlibraries && \
    echo "R_LIBS='/notebooks/Rlibraries'" >> /usr/lib/R/etc/Renviron && \
    echo "setwd('/notebooks')" >> /etc/R/Rprofile.site && \
    echo "---------------------------------------" && \
    echo "Setting up R-studio in data science stack" && \
    echo "---------------------------------------" && \
    echo "www-port=8787" >> /etc/rstudio/rserver.conf && \
    echo "server-app-armor-enabled=0" >> /etc/rstudio/rserver.conf && \
    echo "session-default-working-dir=/notebooks" >> /etc/rstudio/rsession.conf && \
    addgroup rstudio && useradd -m -s /bin/bash -g rstudio rstudio && echo rstudio:rstudio | chpasswd



#5. Finishing installation and additional configuration of data science applications 

COPY install/Python_config.sh /install/Python_config.sh
COPY install/Jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
COPY install/R_config.R /install/R_config.R
COPY install/Spark_config.sh /install/Spark_config.sh
COPY install/start.sh /install/start.sh
WORKDIR /notebooks
ENTRYPOINT ["/install/start.sh"]

