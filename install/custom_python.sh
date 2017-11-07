#!/bin/bash
Libraries="pandas==0.21.0 scipy bokeh plotly"
if [ ! -z "$Libraries" ];
then
  for install in $Libraries
  do
    echo "$install"
    #python -m pip install $install
    #python3 -m pip install scikit-learn

  done
else
  echo "<<<Nothing to install>>>"
fi
