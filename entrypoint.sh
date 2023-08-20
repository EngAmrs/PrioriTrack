#!/bin/bash
bundle install
rm -f tmp/pids/server.pid
rails db:migrate
rails searchkick:reindex:all
bundle exec rails s -p 3000 -b '0.0.0.0'
