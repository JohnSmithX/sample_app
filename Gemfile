source 'https://ruby.taobao.org'


require 'rbconfig'
if RbConfig::CONFIG['target_os'] =~ /mswin|mingw|cygwin/i
  gem 'wdm', '>= 0.1.0'
end
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1.4'
# Use PostgreSQL as the database for Active Record

gem 'pg'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails','~> 2.13.1'
  gem 'guard-rspec','~> 3.1.0'
  gem 'spork-rails','~> 4.0.0'
  gem 'guard-spork','~> 1.5.1'
  gem 'childprocess','~> 0.5.3'
end
gem 'minitest', '~> 5.4.0'
group :test do
  gem 'selenium-webdriver'
  gem 'capybara','~> 2.1.0'
  gem 'factory_girl_rails', '~> 4.4.1'
end

# Use haml template engine
gem 'haml'
gem 'haml-rails'

# Use bootstrap
gem 'bootstrap-sass', '~> 3.2.0.0'
gem 'font-awesome-sass', '~> 4.1.0'

#security password
gem "bcrypt-ruby", '~> 3.1.5'
gem "faker", "~> 1.4.2"
gem "will_paginate", "~> 3.0.7"
gem "bootstrap-will_paginate", "~> 0.0.10"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]
