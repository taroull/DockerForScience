#!/bin/bash
apt-get update -y && apt-get install -y apt-utils wget tar vim locales software-properties-common apt-transport-https ca-certificates python-software-properties libcurl4-openssl-dev libssl-dev && rm -rf /var/lib/apt/lists/*
apt-get update -y && apt-get install -y openjdk-8-jdk && rm -rf /var/lib/apt/lists/*
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.bashrc
