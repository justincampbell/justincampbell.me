source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '~> 3.2'

gem 'airbrake'
gem 'heroku'
gem 'faraday'
gem 'foursquare2'
gem 'jquery-rails'
gem 'kaminari'
gem 'newrelic_rpm'
gem 'rake'
gem 'redcarpet'
gem 'rouge'
gem 'slim-rails'
gem 'unicorn'

group :assets do
  gem 'bourbon'
  gem 'coffee-rails'
  gem 'sass-rails'
  gem 'uglifier'
end

group :production do
  gem 'dalli'
  gem 'memcachier'
  gem 'pg'
end

group :development, :test do
  gem 'foreman'
  gem 'rspec-rails'
  gem 'sqlite3'

  group :guard do
    gem 'guard-rspec'

    group :darwin do
      gem 'rb-fsevent'
      gem 'growl'
    end
  end
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'simplecov'
  gem 'turnip'
end

