FROM ruby:3.1.2

RUN apt-get update -yqq \
    && apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
    && apt-get install -yqq \
    jq \
    && rm -rf /var/lib/apt/lists

ENV RUBYOPT='-W:no-deprecated -W:no-experimental'

WORKDIR /usr/src/app

COPY Gemfile* ./

RUN bundle install --jobs $(($(nproc)-1))

COPY . .