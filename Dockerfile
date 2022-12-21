# syntax=docker/dockerfile:1
FROM kadriansyah/phusion-passenger:latest

LABEL version="1.0"
LABEL maintainer="lukman"

RUN rm /etc/nginx/sites-enabled/default
COPY blog-mongo.com /etc/nginx/sites-available/blog-mongo.com
RUN ln -s /etc/nginx/sites-available/blog-mongo.com /etc/nginx/sites-enabled/blog-mongo.com

RUN set -ex \
    && mkdir /home/app/blog-mongo.com \
    && chown -R app:app /home/app/blog-mongo.com

WORKDIR /home/app/blog-mongo.com
COPY --chown=app:app . .

RUN chmod +x rails_s.sh

RUN chmod +x init-db.sh
RUN chmod +x init-mongo.js

# https://github.com/phusion/passenger-docker#selecting_default_ruby
RUN bash -lc 'rvm use 3.0.3@blog-mongo --create --default'

#install bundler
RUN rvm-exec 3.0.3 gem install bundler:2.3.11

RUN rvm-exec 3.0.3 gem install rails -v 7.0.4

RUN rvm-exec 3.0.3 bundle install --jobs 10
RUN npm install --global yarn

# make sure we make log and tmp owned by app
RUN set -ex \
    && rm -rf log \
    && mkdir log \
    && rm -rf tmp \
    && mkdir tmp
RUN rvm-exec 3.0.3 rails assets:clobber
RUN rvm-exec 3.0.3 rails assets:precompile
RUN set -ex \
    && chown -R app:app /home/app/blog-mongo.com/public \
    && chown -R app:app tmp \
    && chown -R app:app log;

# You cannot open privileged ports (<=1024) as non-root
EXPOSE 8080 3000
CMD ["/sbin/my_init"]
