#!/bin/bash
#Specify as "<library>[==version] [<libraryN>[==version]]
#For example, Libraries="pandas==0.21.0 scipy bokeh plotly"
Libraries="findspark numpy scipy matplotlib pillow scikit-learn imageio"
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

