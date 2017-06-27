#!/bin/bash

# lvs1
# make diff file for /etc/keepalived/keepalived.conf
# diff -uNr keepalived keepalived_dest > etc_keepalived.patch
if [ $1 == "" ]; then
    echo "please input the param"
    exit 0
elif [ $1 == "lvs1" ]; then
    diff -uN keepalived_init/keepalived.conf keepalived1_dest/keepalived.conf > etc_keepalived1.patch
elif [ $1 == "lvs2" ]; then 
    echo "lvs2 not ready"
elif [ $1 == "ats1" ]; then
    # make diff file for /home/nginx/conf
    diff -uNr nginx_conf_init nginx1_conf_dest > nginx1_conf.patch
else
    echo "invalid param, please input the machine name"
fi
# ats1
# make diff file for /home/nginx/conf
