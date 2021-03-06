#!/bin/bash
PIP_TARGET=/notebooks/PyLibraries
export PIP_TARGET=${PIP_TARGET}
export PYTHONPATH=$PIP_TARGET:$PYTHONPATH
echo "export PYTHONPATH=\$PIP_TARGET:\$PYTHONPATH" >> ~/.bashrc
mkdir -p ${PIP_TARGET}/pip
chmod -R 777 ${PIP_TARGET}/pip
export PIP_DOWNLOAD_CACHE=${PIP_TARGET}/pip
mkdir -p ~/.pip
echo -e "[global]\ntarget=${PIP_TARGET}\nno-cache-dir = false\ndownload-cache = ${PIP_TARGET}/pip" >> ~/.pip/pip.conf
echo "export PIP_TARGET=${PIP_TARGET}" >> ~/.bashrc
echo "export PIP_DOWNLOAD_CACHE=${PIP_TARGET}/pip" >> ~/.bashrc
