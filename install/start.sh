#!/bin/bash

/etc/init.d/rstudio-server restart
/opt/spark/sbin/start-master.sh
jupyter notebook --no-browser --allow-root &
tail -f /dev/null 			#Sleep forever(This keeps the container in the state running)
