#!/bin/bash

echo "Stopping Nodejs server..."
sudo fuser -k 3000/tcp



echo "Stoping nginx server..."
sudo systemctl stop nginx

echo "server stopped succesfully!"