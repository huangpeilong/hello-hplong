#!/bin/bash

# make diff file for /etc/keepalived/keepalived.conf
# diff -uNr keepalived keepalived_dest > etc_keepalived.patch
diff -uN keepalived/keepalived.conf keepalived_dest/keepalived.conf > etc_keepalived.patch

# make diff file for /home/nginx/conf
