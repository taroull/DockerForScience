#!/usr/bin/env bash
myip=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
locale-gen en_US.UTF-8
bash /install/Spark_config.sh
if [ "$myip" = "172.27.0.2" ]
then
  echo "Master"
  . /install/envs_config.sh
  mkdir -p /notebooks/Rlibraries
  Rscript /install/R_config.R
  chmod -R 777 /notebooks/PyLibraries
  mkdir -p /notebooks/PyLibraries
  bash /install/Python_config.sh
  chmod -R 777 /notebooks/PyLibraries
  /etc/init.d/rstudio-server restart
  exec jupyter notebook --no-browser --allow-root &> /dev/null &
fi
tail -f /dev/null		#Sleep forever(This keeps the container in the state running)
