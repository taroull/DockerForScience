#!/bin/bash
#Specify as "<library>[==version] … [<libraryN>[==version]]”
#Custom="pandas==0.21.0 bokeh plotly"
Mandatories="findspark numpy scipy matplotlib Pillow scikit-learn imageio "
Custom=""
Libraries=$Mandatories$Custom
List=$(pip list --format=freeze)
if [ ! -z "$Libraries" ];
then
  for install in $Libraries
  do
    #echo "$install"
    if [ -z "`echo $List | grep $install`" ];
    then
      echo "Installing $install"
      python -m pip install $install
      python3 -m pip install $install
    else
      echo "$install already installed"
    fi
  done
else
  echo "<<<Nothing to install>>>"
fi
