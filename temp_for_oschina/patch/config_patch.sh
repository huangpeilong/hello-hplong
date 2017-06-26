#!/bin/bash

# patch for /etc/keepalived/keepalived.conf
if [ $1 == "lvs1" ]; then
    cp ./etc_keepalived1.patch /etc/keepalived/ && cd /etc/keepalived && \
    patch -p1 < etc_keepalived1.patch && rm -rf etc_keepalived1.patch
elif [$1 == "lvs2"]; then 
    echo "lvs2 not ready"
elif [$1 == "ats1"]; then
    echo "ats1 not ready"
else
    echo "invalid param, please input the machine name"
fi
