#!/bin/bash
PIP_TARGET=/notebooks/PyLibraries
export PIP_TARGET=${PIP_TARGET}
mkdir -p ~/.pip
echo "[global]\ntarget=${PIP_TARGET}" >> ~/.pip/pip.conf
echo "export PIP_TARGET=${PIP_TARGET}" >> ~/.bashrc

python -m pip install findspark && python3 -m pip install findspark
python -m pip install numpy && python3 -m pip install numpy
python -m pip install scipy && python3 -m pip install scipy
python -m pip install matplotlib && python3 -m pip install matplotlib
python -m pip install pillow && python3 -m pip install pillow
python -m pip install scikit-learn && python3 -m pip install scikit-learn
python -m pip install imageio && python3 -m pip install imageio
