#!/bin/bash
# Kill any existing instances
pkill -f "http.server 8080" 2>/dev/null
pkill -f localtunnel 2>/dev/null
sleep 1

# Start HTTP server
cd /home/user
python3 -m http.server 8080 >> /tmp/server.log 2>&1 &
echo "HTTP server started (PID $!)"

# Start localtunnel and capture URL
npx localtunnel --port 8080 2>&1 | tee /tmp/tunnel.log &
echo "Tunnel starting..."
sleep 12
grep "url is" /tmp/tunnel.log
