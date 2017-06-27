#!/bin/bash

VER=1.2.8

file_name=keepalived-$VER

if [ ! -d "tar_files" ]; then
    mkdir -p tar_files
fi

cd tar_files

if [ ! -f "$file_name.tar.gz" ]; then
    wget http://www.keepalived.org/software/$file_name.tar.gz
fi
    
if [ ! -d "$file_name" ]; then
    tar -xzvf $file_name.tar.gz
fi

cd $file_name

./configure --prefix=/usr/local/keepalived --enable-snmp && \
make && make -B install 
cp /usr/local/keepalived/etc/rc.d/init.d/keepalived  /etc/init.d/
cp /usr/local/keepalived/etc/sysconfig/keepalived  /etc/sysconfig/
rm -rf /etc/keepalived/
mkdir /etc/keepalived/
cp /usr/local/keepalived/etc/keepalived/keepalived.conf /etc/keepalived/
cp /usr/local/keepalived/sbin/keepalived /usr/sbin/
#ln -s /usr/local/keepalived/sbin/keepalived /usr/local/bin/keepalived
/etc/init.d/keepalived start
