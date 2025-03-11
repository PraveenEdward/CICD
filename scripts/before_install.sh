#!/bin/bash
set -e

echo "Installing Nodejs..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install nodejs nginx -y
sudo systemctl restart nginx
sudo systemctl enable nginx

echo "checking versions..."
node -v
npm -v

echo "setup complete!"


