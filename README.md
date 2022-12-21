# README

This README would normally document whatever steps are necessary to get the
application up and running.

confluence  :

    https://alodokter.atlassian.net/wiki/spaces/PF/pages/3123576833/Create+Docker+on+Rails+Project+using+phusion+passenger+as+base+image

Things you may want to cover:

* You Need :
    - docker : https://docs.docker.com/get-docker/
    - docker compose : https://docs.docker.com/compose/install/
    - docker images ruby : automatically added on run command docker-compose run --no-deps web rails new . --force
    - docker images mongo : automatically added
    - you may need install rails on local : https://guides.rubyonrails.org/v6.1/

* RUN :
    - docker-compose run --no-deps web rails new . --force
    - docker-compose up --build

Check Container :
    - docker container ls
    - docker container ls -a

Run Container after created :
    - docker-compose start


* Ruby version : 3.0.3
* Rails : V7.0.1
* MongoDB : 8

read more for code documentation :
    - https://www.mongodb.com/docs/mongoid/current/tutorials/getting-started-rails/

this code modified from rails mongo documentation, just add configuration docker-compose

what changes ?
    - modification code on file app/config/mongoid.yml
    - add file Dockerfile
    - add file docker-compose.yml
    - add file entrypoint.sh
    - Gemfile
    - Gemfile.lock, delete all code or create new empty file Gemfile.lock