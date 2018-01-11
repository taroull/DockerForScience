#!/bin/bash
PIP_TARGET=/notebooks/PyLibraries
export PIP_TARGET=${PIP_TARGET}
mkdir -p ~/.pip
mkdir -p ${PIP_TARGET}/pip
echo -e "[global]\ntarget=${PIP_TARGET}\ndownload_cache = ${PIP_TARGET}/pip" >> ~/.pip/pip.conf
echo "export PIP_TARGET=${PIP_TARGET}" >> ~/.bashrc
