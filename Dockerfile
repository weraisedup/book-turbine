FROM ruby:3.1.2-slim

ENV NODE_VERSION   'v16.14.0'
ENV HOME           /usr/src
ENV APP_HOME       /usr/src/app
ENV USR_LOCAL_PATH /usr/local
ENV BUNDLE_PATH    $USR_LOCAL_PATH/bundle
ENV BUNDLE_GEMFILE $APP_HOME/Gemfile
ENV BUNDLE_JOBS    2

RUN mkdir -p $HOME \
             $APP_HOME \
             $NVM_DIR \
             $NPM_DIR \
             $BUNDLE_PATH

RUN apt-get update -qq \
  && apt-get install -yq --no-install-recommends \
                     build-essential \
                     gnupg2 \
                     curl \
                     less \
                     git \
                     libpq-dev \
                     postgresql-client \
                     neovim \
                     sudo

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn
RUN yarn global add typescript esbuild
RUN gem update --system && gem install bundler

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR $APP_HOME

COPY Gemfile      $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock
COPY package.json $APP_HOME/package.json
COPY yarn.lock    $APP_HOME/yarn.lock

# Run yarn install to install JavaScript dependencies.
RUN yarn install --check-files
RUN gem install foreman pg
RUN bundle install --jobs 20 --retry 5

EXPOSE 3000

CMD ["./bin/dev"]
