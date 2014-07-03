source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>4.0.5'

#mongo
gem 'mongoid', '4.0.0.beta1'
gem 'mongoid-paperclip', require: 'mongoid_paperclip'
gem 'mongoid_slug'
gem 'mongoid_orderable'
gem 'mongoid_acts_as_page', '~> 0.5.1'

# handlers
gem 'slim-rails'

# AA
gem 'activeadmin',         github: 'gregbell/active_admin', ref: '65aae6b68e78aad3071b2f85242b19fd3fccf426'
gem 'activeadmin-mongoid', github: 'elia/activeadmin-mongoid', branch: 'rails4'
gem 'activeadmin-sortable'
gem 'activeadmin_images'
gem 'activeadmin_tinymce'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem 'selenium-webdriver'
  gem 'rack'
  gem 'coveralls', require: false
  gem 'simplecov', require: false
  gem 'unicorn_service', require: false
  gem 'nginx-config', require: false
  gem 'email_spec'
end

group :development do
  gem 'quiet_assets'
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'net-ssh', '~> 2.7.0'
end


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
