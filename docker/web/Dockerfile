FROM ruby:2.6.6
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y nodejs=14.16.0-1nodesource1 yarn default-mysql-client

ENV ROOT_PATH /home/edge_library
ENV BUNDLER_VERSION 2.2.14
WORKDIR $ROOT_PATH
COPY Gemfile $ROOT_PATH/Gemfile
COPY Gemfile.lock $ROOT_PATH/Gemfile.lock
RUN gem update --system && \
    gem install bundler -v $BUNDLER_VERSION && \
    bundle install -j 4 && \
    mv -f $ROOT_PATH/Gemfile /tmp/ && \
    mv -f $ROOT_PATH/Gemfile.lock /tmp/

COPY package.json $ROOT_PATH/package.json
COPY yarn.lock $ROOT_PATH/yarn.lock
RUN yarn install

COPY . $ROOT_PATH
RUN  mv -f /tmp/Gemfile $ROOT_PATH/ && \
     mv -f /tmp/Gemfile.lock $ROOT_PATH/

CMD ["rails", "server", "-b", "0.0.0.0"]
