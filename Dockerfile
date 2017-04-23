FROM ruby:latest

WORKDIR /omniauth-frederick
ADD Gemfile /omniauth-frederick
ADD omniauth-frederick.gemspec /omniauth-frederick
ADD lib/omniauth/frederick/version.rb /omniauth-frederick/lib/omniauth/frederick/version.rb

RUN bundle install -j8

ADD . /omniauth-frederick/

ENV DOCKER=true
