FROM ruby:2.6.3-alpine

ENV LANG C.UTF-8
ENV TZ=Asia/Tokyo
ENV HANAMI_ROOT=/srv/

WORKDIR $HANAMI_ROOT

ADD ./Gemfile $HANAMI_ROOT/Gemfile
ADD ./Gemfile.lock $HANAMI_ROOT/Gemfile.lock

RUN apk update && apk upgrade
RUN apk add --update --no-cache --virtual=.build-dependencies \
      build-base \
      curl-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      ruby-dev \
      yaml-dev \
      zlib-dev \
      mysql-dev && \
    apk add --update --no-cache \
      bash \
      openssh \
      openssl \
      ruby-json \
      mysql-client \
      mariadb-dev \
      tzdata \
      yaml && \
    gem install bundler:2.0.1 && \
    bundle install -j4 && \
    apk del .build-dependencies

ADD . $HANAMI_ROOT

RUN chmod +x bin/entrypoint
