#!/bin/bash
docker run -d --name blog-mongo -v "$PWD":/home/app/blog-mongo.com -p 3000:3000 lukmanbap/blog-mongo:latest
