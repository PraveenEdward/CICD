#!/bin/bash
set -e  

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


# Install dependencies if package.json exists
if [ -f package.json ]; then
  sudo -u ubuntu npm install --silent
fi

# Start the server as ubuntu user
sudo -u ubuntu nohup node server.js > /dev/null 2>&1 &

echo "Server started successfully!"
