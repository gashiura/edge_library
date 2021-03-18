FROM ruby:2.6.6
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y nodejs yarn default-mysql-client

ENV ROOT_PATH /home/edge_library
WORKDIR $ROOT_PATH
COPY Gemfile $ROOT_PATH/Gemfile
COPY Gemfile.lock $ROOT_PATH/Gemfile.lock
RUN bundle install

COPY package.json $ROOT_PATH/package.json
COPY yarn.lock $ROOT_PATH/yarn.lock
RUN yarn install

COPY . $ROOT_PATH

CMD ["rails", "server", "-b", "0.0.0.0"]
