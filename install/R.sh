#!/bin/bash
R_ARCH='amd64'
R_SO_VER='xenial/'
R_REPO='https://cran.rstudio.com/bin/linux/ubuntu'
apt-get update && apt-get install -y software-properties-common apt-transport-https ca-certificates
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
add-apt-repository "deb [arch=$R_ARCH] $R_REPO $R_SO_VER"
apt-get update -y
apt-get install -y r-base
apt-get install -y libcurl4-openssl-dev libssl-dev

# install IRkernel
# https://github.com/IRkernel/IRkernel
# http://irkernel.github.io/installation/
