#!/bin/bash

echo "Updating the Server..."
sudo apt update && sudo apt upgrade -y

echo "Configuring Web-server..."
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Installing Nodejs..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

echo "checking versions..."
node -v
npm -v

echo "setup complete!"


