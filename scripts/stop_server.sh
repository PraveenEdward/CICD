#!/bin/bash

# Stop the Node.js app running on a specific port
echo "Stopping Node.js application..."

# Find the process running on a specific port (e.g., 3000) and kill it
PID=$(lsof -t -i:3000)

if [ -n "$PID" ]; then
    echo "Stopping process with PID: $PID"
    kill -9 $PID
else
    echo "No process found running on port 3000."
fi

echo "Node.js application stopped successfully."
