#!/bin/bash

# patch for /etc/keepalived/keepalived.conf
if [ $1 == "" ]; then
    echo "please input the param"
    exit 0
elif [ $1 == "lvs1" ]; then
    cp ./etc_keepalived1.patch /etc/keepalived/ && cd /etc/keepalived && \
    patch -p1 < etc_keepalived1.patch && rm -rf etc_keepalived1.patch
elif [ $1 == "lvs2" ]; then 
    echo "lvs2 not ready"
elif [ $1 == "ats1" ]; then
    # patch for /home/nginx/conf
    cp ./nginx1_conf.patch /home/nginx/conf && cd /home/nginx/conf && \
    patch -p1 < nginx1_conf.patch && rm -rf nginx1_conf.patch
else
    echo "invalid param, please input the machine name"
fi
