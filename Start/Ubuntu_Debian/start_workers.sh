#!/bin/bash

if [ "$1" = "" ]
then
NWorkers=2
else
NWorkers=$1
fi
CNT=0
while [ $CNT -lt $NWorkers ]; do
  ./execute_worker.sh &
  CNT=$((CNT+1))
done
