FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# Variables necesarias para precompilar
ARG SECRET_KEY_BASE
ENV RAILS_ENV=production
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE

RUN bundle exec rails assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

