#!/bin/bash
set -e
mongosh --host mongo-blog:27017  --eval 'use blog_development; db.createUser({user:"grumpycat",pwd:"alo123",roles:[{role: "readWrite", db: "blog_development"}],mechanisms:["SCRAM-SHA-1"]});'
# RAILS_ENV='production' bundle exec rails db:seed
