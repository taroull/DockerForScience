#!/bin/bash
apt-get update -y && apt-get install -y apt-utils && rm -rf /var/lib/apt/lists/*
apt-get update -y && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
apt-get update -y && apt-get install -y default-jre && rm -rf /var/lib/apt/lists/*
apt-get update -y && apt-get install -y tar && rm -rf /var/lib/apt/lists/*
apt-get update -y && apt-get install -y vim && rm -rf /var/lib/apt/lists/*
apt-get update -y && apt-get install -y locales && rm -rf /var/lib/apt/lists/*
