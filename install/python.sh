#!/bin/bash
apt-get update -y
apt-get install -y python python-dev python-pip
apt-get install -y python3 python3-dev python3-pip
python -m pip install --upgrade pip
python3 -m pip install --upgrade pip
