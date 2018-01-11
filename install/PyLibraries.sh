#!/bin/bash
PIP_TARGET=/notebooks/PyLibraries
export PIP_TARGET=${PIP_TARGET}
mkdir -p ~/.pip
echo -e "[global]\ntarget=${PIP_TARGET}" >> ~/.pip/pip.conf
echo "export PIP_TARGET=${PIP_TARGET}" >> ~/.bashrc
