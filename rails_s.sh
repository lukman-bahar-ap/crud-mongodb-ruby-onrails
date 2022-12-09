#!/bin/bash
rails_pid=$(cat /home/app/blog-mongo.com/tmp/pids/server.pid)
if output=$(ps -p "$rails_pid")
then
  echo "PID Rails Found: $output"
  kill -9 $rails_pid
fi
rvm-exec 3.0.3 rails s -b 0.0.0.0