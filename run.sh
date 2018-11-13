#!/bin/sh

echo "staring nginx for webUI..."
nginx
if [ "${secret}"="" ] then
    echo "staring aria2 without password..."
    aria2c --enable-rpc --rp-clisten-all --dir=/download
else
    echo "staring aria2 with password..."
    aria2c --rpc-secret=${secret} --enable-rpc --rp-clisten-all --dir=/download
fi