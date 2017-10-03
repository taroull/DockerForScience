#!/bin/bash
apt-get update && apt-get install -y software-properties-common apt-transport-https ca-certificates
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
apt-get update -y
apt-get install -y r-base
apt-get install -y libcurl4-openssl-dev libssl-dev
#apt-get install -y libssl-dev


# install IRkernel
# https://github.com/IRkernel/IRkernel
# http://irkernel.github.io/installation/
#
# R -e "install.packages(c('rzmq','repr','IRkernel','IRdisplay'), repos = c('http://irkernel.github.io/', 'http://cran.rstudio.com/'))"
# #su vagrant -c "R -e 'IRkernel::installspec()' "
# #sudo -u vagrant sh -c "R -e 'IRkernel::installspec()' "
# R -e "IRkernel::installspec()"

# R -e "chooseCRANmirror(graphics=FALSE, ind=1)"
# R -e "install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'))"
# R -e "devtools::install_github('IRkernel/IRkernel')"
# R -e "update.packages()"
# R -e "IRkernel::installspec(user = FALSE)"
