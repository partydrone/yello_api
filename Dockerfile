ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}-slim

RUN apt-get update -qq && apt-get install -y build-essential \
  curl \
  git \
  libpq-dev \
  tzdata \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

WORKDIR /srv/app

COPY Gemfile* ./

RUN gem update --system
RUN bundle check || bundle install -j $(nproc)
