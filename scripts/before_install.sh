#!/bin/bash
set -e

echo "Updating system..."
sudo apt update -y

echo "Installing Node.js 18..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

echo "installing webserver" 
sudo apt install nginx -y
sudo systemctl restart nginx
sudo systemctl enable nginx

echo "Stopping existing application..."
pm2 stop all || true
