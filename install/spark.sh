#!/bin/bash
SPARK_VER="2.2.0"
HADOOP_VER="2.7"
SPARK_DIST="spark-$SPARK_VER-bin-hadoop$HADOOP_VER"
SPARK_URL="https://d3kbcqa49mib13.cloudfront.net/$SPARK_DIST.tgz"
INSTALL_DIR="/opt"

wget -P /tmp -c $SPARK_URL
tar xzvf /tmp/$SPARK_DIST.tgz -C $INSTALL_DIR && mv /opt/spark-$SPARK_VER-bin-hadoop$HADOOP_VER/ /opt/spark && rm /tmp/$SPARK_DIST.tgz
ln -s /opt/spark-$SPARK_VER /opt/spark

echo "export PYTHONPATH=$SPARK_HOME/python/:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$SPARK_HOME/python/lib/pyspark.zip:$PYTHONPATH" >> ~/.bashrc
echo "export SPARK_HOME=/opt/spark" >> ~/.bashrc
echo "export PATH=$PATH:$SPARK_HOME/bin" >> ~/.bashrc
