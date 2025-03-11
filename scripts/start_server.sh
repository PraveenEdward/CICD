#!/bin/bash

APP_DIR="/var/www/html"
cd $APP_DIR
nohup node server.js
sudo systemctl restart nginx

