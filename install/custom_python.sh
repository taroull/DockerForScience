#!/bin/bash
Modules=""
if [ ! -z "$Modules" ];
then
  for install in $Modules
  do
    #echo "$install"
    python -m pip install $install
    #python3 -m pip install scikit-learn

  done
else
  echo "<<<Nothing to install>>>"
fi
