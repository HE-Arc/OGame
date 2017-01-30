FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /galactic_empire
WORKDIR /galactic_empire
ADD code/Gemfile /galactic_empire/Gemfile
ADD code/Gemfile.lock /galactic_empire/Gemfile.lock
RUN bundle install
ADD code/. /galactic_empire
