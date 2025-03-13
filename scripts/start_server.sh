#!/bin/bash
set -e  # Exit if any command fails

echo "Starting Node.js server..."

# Kill existing Node.js process on port 3000
PID=$(lsof -t -i:3000) || true
if [ ! -z "$PID" ]; then
  echo "Stopping existing process (PID: $PID)"
  kill -9 $PID
  sleep 2
fi

# Ensure correct working directory
cd /var/www/html

# Use absolute path to node
NODE_PATH=$(which node)
if [ -z "$NODE_PATH" ]; then
  echo "Node.js is not installed. Exiting..."
  exit 1
fi

# Install dependencies if package.json exists
if [ -f package.json ]; then
  sudo -u ubuntu npm install --silent
fi

# Start the server as ubuntu user
sudo -u ubuntu nohup "$NODE_PATH" server.js > /dev/null 2>&1 &

disown

echo "Server started successfully!"
