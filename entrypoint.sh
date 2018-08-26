#!/bin/bash

chown -R apache:apache /webroot
memcached -p 9963 -d start -u apache
nginx
php-fpm


while true
do
    sleep 1m
done