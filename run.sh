#!/bin/sh
echo "staring nginx for webUI..."
/usr/sbin/nginx
echo "nameserver 8.8.8.8" > /etc/resolv.conf
if [ "${secret}" = "" ]; then
    echo "staring aria2 without password..."
    aria2c --enable-rpc --rpc-listen-all --dir=/download
else
    echo "staring aria2 with password..."
    aria2c --rpc-secret=${secret} --enable-rpc --rpc-listen-all --dir=/download
fi
