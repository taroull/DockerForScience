#!/bin/bash
PIP_TARGET=/notebooks/PyLibraries
export PIP_TARGET=${PIP_TARGET}
mkdir -p ${PIP_TARGET}/pip
export PIP_DOWNLOAD_CACHE=${PIP_TARGET}/pip
mkdir -p ~/.pip
echo -e "[global]\ntarget=${PIP_TARGET}\ndownload-cache = ${PIP_TARGET}/pip" >> ~/.pip/pip.conf
echo "export PIP_TARGET=${PIP_TARGET}" >> ~/.bashrc
