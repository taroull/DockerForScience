#!/bin/bash
masterip='172.27.0.2'
myip=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
if [ "$myip" = "$masterip" ]
then
    echo "Master"
    echo "SPARK_MASTER_HOST=$myip" >> /opt/spark/conf/spark-env.sh
    /opt/spark/sbin/start-master.sh
else
    echo "Worker"
    echo "SPARK_MASTER_HOST=$masterip" >> /opt/spark/conf/spark-env.sh
    echo "SPARK_WORKER_CORES=2" >> /opt/spark/conf/spark-env.sh
    echo "SPARK_WORKER_MEMORY=1g" >> /opt/spark/conf/spark-env.sh
    /opt/spark/sbin/start-slave.sh spark://$masterip:7077

fi
