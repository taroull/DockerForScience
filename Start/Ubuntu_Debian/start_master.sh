#!/bin/bash

dir="notebooks"
docker network rm docker4science
docker network create --subnet 172.27.0.0/24 --driver bridge docker4science
docker run --net=docker4science -v $pwd/../../$dir:/notebooks/ -ti --rm --name master -p 10088:8888 -p 10080:8080 -p 10087:8787 docker4science:1.0
