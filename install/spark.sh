#!/bin/bash
SPARK_VER="2.2.0"
HADOOP_VER="2.7"
SPARK_DIST="spark-$SPARK_VER-bin-hadoop$HADOOP_VER"
SPARK_URL="https://d3kbcqa49mib13.cloudfront.net/$SPARK_DIST.tgz"
INSTALL_DIR="/opt"

wget -P /tmp -c $SPARK_URL
tar xzvf /tmp/$SPARK_DIST.tgz -C $INSTALL_DIR && mv /opt/spark-$SPARK_VER-bin-hadoop$HADOOP_VER/ /opt/spark && rm /tmp/$SPARK_DIST.tgz
ln -s /opt/spark-$SPARK_VER /opt/spark

# echo "export SPARK_HOME=/opt/spark" >> ~/.bashrc
# echo "export PYTHONPATH=\$SPARK_HOME/python/:\$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:\$SPARK_HOME/python/lib/pyspark.zip:\$PYTHONPATH" >> ~/.bashrc
# echo "export PATH=\$PATH:\$SPARK_HOME/bin" >> ~/.bashrc
# echo "export SPARK_HOME=/opt/spark" >> ~/.bashrc
# echo "export PATH=\$SPARK_HOME/bin:\$PATH" >> ~/.bashrc
# echo "export PYTHONPATH=\$SPARK_HOME/python:\$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:\$SPARK_HOME/python/lib/pyspark.zip" >> ~/.bashrc
# echo "export PYSPARK_DRIVER_PYTHON=\"jupyter\"" >> ~/.bashrc
# echo "export PYSPARK_DRIVER_PYTHON_OPTS=\"notebook --no-browser --allow-root\"" >> ~/.bashrc
# For python 3 users, you have to add the line below or you will get an error
# echo "export PYSPARK_PYTHON=python3" >> ~/.bashrc
