#!/bin/bash

mkdir -p /etc/nginx/ssl/

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/hamza.crt \
    -keyout /etc/nginx/ssl/hamza.key \
    -subj "/C=MA/ST=BMK/L=Khouribga/O=1337/CN=hasalam.42.fr"

nginx -g 'daemon off;'