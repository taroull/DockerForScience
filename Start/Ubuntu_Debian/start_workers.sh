#!/bin/bash
NWorkers=2
CNT=0
while [ $CNT -lt $NWorkers ]; do
  ./execute_worker.sh &
  CNT=$((CNT+1))
done
