#!/bin/bash

chown -R www:www /webroot
memcached -p 9963 -l 127.0.0.1 -d start -u www
nginx
php-fpm


while true
do
    sleep 1m
done
