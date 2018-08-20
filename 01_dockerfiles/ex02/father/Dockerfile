FROM ruby
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs sqlite3

ONBUILD COPY my_app /opt/app
ONBUILD WORKDIR /opt/app

ONBUILD EXPOSE 3000

ONBUILD RUN bundle update \
			&& bundle install \
			&& rake db:migrate \
			&& rake db:seed

# Sources:
# https://docs.docker.com/engine/reference/builder/#onbuild
# https://stackoverflow.com/questions/34863114/dockerfile-onbuild-instruction
# https://docs.docker.com/compose/rails/
# https://bundler.io/man/bundle-install.1.html

# bundle-install - Install the dependencies specified in your Gemfile
# rake db:migrate          # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
# rake db:seed             # Load the seed data from db/seeds.rb