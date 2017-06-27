#!/bin/bash
#This script is used to install nginx with lua.

wget -c http://luajit.org/download/LuaJIT-2.0.4.tar.gz
tar -zxvf LuaJIT-2.0.4.tar.gz
cd LuaJIT-2.0.4 && make && make install && \
ln -s /usr/local/lib/libluajit-5.1.so.2 /usr/lib64

wget -c http://nginx.org/download/nginx-1.10.3.tar.gz
tar -zxvf nginx-1.10.3.tar.gz

git clone https://github.com/simpl/ngx_devel_kit.git

git clone https://github.com/openresty/lua-nginx-module.git

LUA_NGINX_MODULE="lua-nginx-module"
NGX_DEVEL_KIT="ngx_devel_kit"
NGINX="nginx-1.10.3"
NGINX_DIR="/home/nginx"

if [ ! -d "$NGINX_DIR" ];then
        mkdir -p "$NGINX_DIR"
fi

yum -y install pcre-devel

#install nginx
cd "$NGINX"
./configure --prefix="$NGINX_DIR" \
--add-module=../"$LUA_NGINX_MODULE" \
--add-module=../"$NGX_DEVEL_KIT" \
--with-cc-opt='-O3 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic' \
--with-file-aio \
--with-http_gzip_static_module \
--with-http_realip_module \
--with-http_secure_link_module \
--with-http_ssl_module \
--with-http_stub_status_module \
--with-http_sub_module \
--with-ld-opt=-Wl,-E \
--with-pcre

make && make install
cd ..

cd "$NGINX_DIR"
./sbin/nginx

[ $? -eq 0 ] && echo "Install success"
