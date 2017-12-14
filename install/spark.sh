#!/bin/bash
SPARK_VER="2.2.0"
HADOOP_VER="2.7"
SPARK_DIST="spark-$SPARK_VER-bin-hadoop$HADOOP_VER"
SPARK_URL="https://d3kbcqa49mib13.cloudfront.net/$SPARK_DIST.tgz"
INSTALL_DIR="/opt"
wget -P /tmp -c $SPARK_URL
tar xzvf /tmp/$SPARK_DIST.tgz -C $INSTALL_DIR && mv /opt/spark-$SPARK_VER-bin-hadoop$HADOOP_VER/ /opt/spark && rm /tmp/$SPARK_DIST.tgz
ln -s /opt/spark-$SPARK_VER /opt/spark
SPARK_HOME=/opt/spark
echo "export PATH=$PATH:$SPARK_HOME/bin" >> ~/.bashrc
