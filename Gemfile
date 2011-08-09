source 'http://rubygems.org'

gem 'rails', '3.1.0.rc5'

gem 'json'
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'
gem 'rdiscount'

gem 'heroku'
gem 'newrelic_rpm'

group :production do
  gem 'pg'
  gem 'therubyracer-heroku'
end

group :development, :test do
  gem 'sqlite3'
  
  gem 'guard'
  gem 'guard-test'
  gem 'ruby-prof'
  
  group :darwin do
    gem 'powder'
    gem 'rb-fsevent'
    gem 'growl'
  end
end

