#!/bin/bash
pip install --upgrade pip && pip install jupyter
python -m pip install ipykernel && python -m ipykernel install --user
python3 -m pip install ipykernel && python3 -m ipykernel install --user
# echo "export PIP_TARGET=/notebooks/PyLibraries" >> ~/.bashrc
