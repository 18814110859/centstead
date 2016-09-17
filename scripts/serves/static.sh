#!/usr/bin/env bash

block="server {
    listen ${4:-80};
    listen ${5:-443} ssl;
    autoindex on;
    server_name $2;
    root \"$3\";

    add_header 		Access-Control-Allow-Origin *;

    ssl_certificate     /etc/nginx/ssl/$1.crt;
    ssl_certificate_key /etc/nginx/ssl/$1.key;
}
"

echo "$block" >> "/etc/nginx/sites/centstead-$1"