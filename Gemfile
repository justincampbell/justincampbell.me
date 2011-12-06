source 'http://rubygems.org'

gem 'rails', '~> 3.1'
gem 'jquery-rails'

gem 'rdiscount'

gem 'heroku'
gem 'airbrake'
gem 'newrelic_rpm'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :production do
  gem 'dalli'
  gem 'hirefireapp'
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'

  gem 'foreman'

  gem 'guard'
  gem 'guard-test'

  gem 'wirble'

  group :darwin do
    gem 'powder'
    gem 'rb-fsevent'
    gem 'growl'
  end

  gem 'ghi'

  gem 'airbrake-api'
  gem 'httparty'
end

