#!/bin/bash

APP_DIR="/var/www/html"

cd $APP_DIR


echo "Setting up Permissions"
sudo chown -R ubuntu:ubuntu $APP_DIR
sudo chown -R 755 $APP_DIR

sudo npm init -y
npm install express mysql dotenv