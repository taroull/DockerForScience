#!/bin/bash
masterip='172.27.0.2'
myip=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
export SPARK_HOME=/opt/spark
echo "export SPARK_HOME=/opt/spark" >> ~/.bashrc
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.bashrc
export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
# For python 3 users, you have to add the line below or you will get an error
# For python 2 users you have to change this variable to PYSPARK_PYTHON=python
export PYSPARK_PYTHON=python3

if [ "$myip" = "$masterip" ]
then
    echo "Master"
    echo "SPARK_MASTER_HOST=$myip" >> /opt/spark/conf/spark-env.sh
    export PYTHONPATH=$SPARK_HOME/python/:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$SPARK_HOME/python/lib/pyspark.zip:$PYTHONPATH
    echo "export PYTHONPATH=\$SPARK_HOME/python/:\$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:\$SPARK_HOME/python/lib/pyspark.zip:\$PYTHONPATH" >> ~/.bashrc
    export PATH=$PATH:$SPARK_HOME/bin
    echo "export PATH=\$PATH:\$SPARK_HOME/bin" >> ~/.bashrc
    /opt/spark/sbin/start-master.sh
else
    echo "Worker"
    echo "SPARK_MASTER_HOST=$masterip" >> /opt/spark/conf/spark-env.sh
    echo "SPARK_WORKER_CORES=2" >> /opt/spark/conf/spark-env.sh
    echo "SPARK_WORKER_MEMORY=1g" >> /opt/spark/conf/spark-env.sh
    /opt/spark/sbin/start-slave.sh spark://$masterip:7077
fi
