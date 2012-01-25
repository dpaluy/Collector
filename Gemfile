source 'https://rubygems.org'

if RbConfig::CONFIG['host_os'] =~ /linux/i
  gem 'therubyracer', '>= 0.9.8'
end

gem 'rails', '3.2.0'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "mongoid", "~> 2.4"
gem "mongoid_dynamic_finder"
gem "bson_ext", "~> 1.5"

gem 'kaminari'
gem 'money'
gem 'date_validator'
gem "simple_form"
gem "haml", ">= 3.1.2"
# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "rspec-rails", ">= 2.8.0.rc1", :group => [:development, :test]
group :development do
  gem "nifty-generators"
  gem "haml-rails", ">= 0.3.4"
  gem 'ruby_parser'
  gem 'hpricot'
  gem "guard", ">= 0.6.2"
  case RbConfig::CONFIG['host_os']
    when /darwin/i
      gem 'rb-fsevent'
      gem 'growl'
    when /linux/i
      gem 'libnotify'
      gem 'rb-inotify'
    when /mswin|windows/i
      gem 'rb-fchange'
      gem 'win32console'
      gem 'rb-notifu'
  end
  gem "guard-bundler", ">= 0.1.3"
  gem "guard-rails", ">= 0.0.3"
  gem "guard-livereload", ">= 0.3.0"
  gem "guard-rspec", ">= 0.4.3"
  gem "guard-cucumber", ">= 0.6.1"
  gem "em-websocket"
end

group :test do
  gem "database_cleaner", ">= 0.7.0"
  gem "mongoid-rspec", ">= 1.4.4"
  gem "factory_girl_rails", ">= 1.4.0"
  gem "cucumber-rails", ">= 1.2.0"
  gem "capybara", ">= 1.1.2"
  gem "launchy", ">= 2.0.5"
  gem 'pickle'
  gem 'simplecov'
  gem "mocha"
end

gem "heroku"
gem "thin"

