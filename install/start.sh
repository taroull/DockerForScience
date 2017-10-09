#!/bin/bash
myip=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
#
if [ "$myip" = "172.17.0.2" ]
then
  echo "Master"
  /etc/init.d/rstudio-server restart
  bash /etc/SparkConf.sh
  jupyter notebook --no-browser --allow-root &
  tail -f /dev/null 			#Sleep forever(This keeps the container in the state running)
else
  bash /etc/SparkConf.sh
  tail -f /dev/null 			#Sleep forever(This keeps the container in the state running)
fi
