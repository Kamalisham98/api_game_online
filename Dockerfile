# sudo docker build -t api_rails:6.1 -f Dockerfile .

FROM ruby:3.0.6

# Update Image
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libmariadb-dev-compat \
  libmariadb-dev \
  nodejs \
  yarn

# Error Msg: Your RubyGems version (3.0.3)) has a bug that prevents `required_ruby_version` from working for Bundler. Any scripts that use `gem install bundler` will break as soon as Bundler drops support for your Ruby version. Please upgrade RubyGems to avoid future breakage and silence this warning by running `gem update --system 3.2.3`
# RUN gem update --system 3.2.33
# RUN gem update --system
# Ruby 3.0.6 requires bundler 2
# RUN gem install bundler:2.3.11
# RUN gem install bundler

# Set the default work directory in the docker image
WORKDIR /app

# Copy the Gemfiles to install the gems
# Assumes `docker build` executed inside `/api/railsapp`
# `~/api/railsapp$ sudo docker build -t rails -f ./docker/tl_rails.Dockerfile .`
COPY Gemfile Gemfile.lock ./

# Install the gems based on Gemfile.lock
RUN bundle install
