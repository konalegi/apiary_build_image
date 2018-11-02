FROM ruby:2.3.3
MAINTAINER Danil Nurgaliev <jkonalegi@gmail.com>

RUN apt-get update -qq && \
    apt-get install -y build-essential --fix-missing --no-install-recommends \
    nodejs npm inotify-tools make g++ python

RUN npm cache clean -f
RUN npm install -g n
RUN n 6.11.5
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g hercule
RUN gem install apiaryio -v '0.8.1'
RUN npm install --global --unsafe-perm apib2json

ENV BUILD_ROOT /var/www/app

RUN mkdir -p $BUILD_ROOT

WORKDIR $BUILD_ROOT

ADD . $BUILD_ROOT

ENTRYPOINT ["/var/www/app/entrypoint.sh"]
