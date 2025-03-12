#!/bin/bash
set -e

echo "Updating system..."
sudo apt update -y

echo "Installing Node.js 18..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

echo "Verifying Node.js installation..."
node -v
npm -v

echo "Stopping existing application..."
pm2 stop all || true
