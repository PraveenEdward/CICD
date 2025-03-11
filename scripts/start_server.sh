#!/bin/bash
set -e

echo "Stopping any existing Node.js process..."
pkill -f "node server.js" || true

echo "Starting Node.js server..."
nohup node server.js > server.log 2>&1 &

echo "Restarting Nginx..."
sudo systemctl restart nginx

echo "Application started successfully!"
