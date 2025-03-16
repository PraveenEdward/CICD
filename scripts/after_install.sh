#!/bin/bash
set -e

cd /var/www/html

echo "Checking for package.json..."
if [ ! -f package.json ]; then
  echo "package.json not found! Initializing Node.js project..."
  npm init -y
  npm install express mysql dotenv
else
  echo "package.json found, installing dependencies..."
  npm install
fi

echo "Setting up Permissions..."
sudo chown -R ubuntu:ubuntu /var/www/html
sudo chmod -R 755 /var/www/html

echo "Verifying database.env..."
if [ -f /var/www/html/database.env ]; then
  echo "database.env found, keeping it unchanged."
else
  echo "ERROR: database.env is missing! Deployment failed."
  exit 1
fi

echo "Setup Complete"
