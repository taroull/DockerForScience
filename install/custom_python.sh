#!/bin/bash
#Specify as "<library>[==version] … [<libraryN>[==version]]”
#Libraries="pandas==0.21.0 scipy bokeh plotly"
Libraries=""
if [ ! -z "$Libraries" ];
then
  for install in $Libraries
  do
    #echo "$install"
    python -m pip install $install
    python3 -m pip install $install
  done
else
  echo "<<<Nothing to install>>>"
fi
