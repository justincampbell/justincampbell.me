source 'http://rubygems.org'

gem 'rails', '3.1.0.rc4'

gem 'json'
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'

gem 'heroku'

group :development, :test do
  gem 'sqlite3'
  
  gem 'guard'
  gem 'guard-test'
  gem 'ruby-prof'
  
  gem 'powder'
  
  require 'rbconfig'
  if RbConfig::CONFIG['host_os'] =~ /darwin/i
    gem 'rb-fsevent'
    gem 'growl'
  end
end

