#!/bin/bash
set -e

echo "Starting Node.js server..." | tee -a /var/www/html/startup.log

# Kill existing process on port 3000
PID=$(lsof -t -i:3000)
if [ ! -z "$PID" ]; then
  echo "Stopping existing Node.js process on port 3000 (PID: $PID)..." | tee -a /var/www/html/startup.log
  kill -9 $PID
fi

# Start the Node.js app as the ubuntu user
sudo -u ubuntu nohup node /var/www/html/server.js > /var/www/html/output.log 2>&1 &

echo "Server started successfully!" | tee -a /var/www/html/startup.log
