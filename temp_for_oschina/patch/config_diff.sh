#!/bin/bash

# lvs1
# make diff file for /etc/keepalived/keepalived.conf
# diff -uNr keepalived keepalived_dest > etc_keepalived.patch
if [ $1 == "lvs1" ]; then
    diff -uN keepalived1_init/keepalived.conf keepalived1_dest/keepalived.conf > etc_keepalived1.patch
elif [ $1 == "lvs2" ]; then 
    echo "lvs2 not ready"
elif [ $1 == "ats1" ]; then
    echo "ats1 not ready"
else
    echo "invalid param, please input the machine name"
fi
# ats1
# make diff file for /home/nginx/conf
