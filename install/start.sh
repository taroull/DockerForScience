#!/bin/bash
myip=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
if [ "$myip" = "172.27.0.2" ]
then
  echo "Master"
  locale-gen en_US.UTF-8
  mkdir -p /notebooks/Rlibraries
  chmod -R 777 /notebooks/Rlibraries
  Rscript /install/Rconfig.R

  mkdir -p /notebooks/PyLibraries
  chmod -R 777 /notebooks/PyLibraries
  . /install/PyLibraries.sh
  . /install/custom_python.sh

  /etc/init.d/rstudio-server restart
  . /install/SparkConf.sh
  exec jupyter notebook --no-browser --allow-root &> /dev/null &
  tail -f /dev/null 	#Sleep forever(This keeps the container in the state running)
else
  locale-gen en_US.UTF-8
  bash /install/SparkConf.sh
  tail -f /dev/null		#Sleep forever(This keeps the container in the state running)
fi
