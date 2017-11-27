#!/bin/bash
RS_VER="1.0.153"
RS_ARCH="amd64"
apt-get install -y gdebi-core
wget "https://download2.rstudio.org/rstudio-server-$RS_VER-$RS_ARCH.deb"
gdebi -n rstudio-server-1.0.153-amd64.deb

echo "www-port=8787" >> /etc/rstudio/rserver.conf
echo "server-app-armor-enabled=0" >> /etc/rstudio/rserver.conf
echo "session-default-working-dir=/notebooks" >> /etc/rstudio/rsession.conf
ln -s /usr/lib/rstudio-server/extras/init.d/debian/rstudio-server /etc/init.d/rstudio-server
addgroup rstudio
useradd -m -s /bin/bash -g rstudio rstudio
#echo rstudio:1234 | chpasswd
echo rstudio:rstudio | chpasswd
