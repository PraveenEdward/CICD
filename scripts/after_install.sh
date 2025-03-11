#!/bin/bash
set -e

cd /var/www/html

echo "installing dependicies..."
npm init -y
npm install express mysql dotenv

echo "Setting up Permissions"
sudo chown -R ubuntu:ubuntu $APP_DIR
sudo chmod -R 755 $APP_DIR

echo "Setup Complete"