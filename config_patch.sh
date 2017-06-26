#!/bin/bash

# patch for /etc/keepalived/keepalived.conf
cp ./etc_keepalived.patch /etc/keepalived/ && cd /etc/keepalived && \
patch -p1 < etc_keepalived.patch && rm -rf etc_keepalived.patch

