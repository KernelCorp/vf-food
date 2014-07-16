source 'https://rubygems.org'

#core
gem 'rails', '~>4.0.5'
gem 'mongoid', '4.0.0.beta1'

#front

# handlers
gem 'bootstrap-sass', '~> 3.2.0'
gem 'sass-rails', '~> 4.0.2'
gem 'coffee-rails', '~> 4.0.0'
gem 'slim-rails'
gem 'compass-rails'
gem 'jbuilder', '~> 1.2'

# assets
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 4.2.1'
gem 'turbolinks'

# various
gem 'uglifier', '>= 1.3.0'
gem 'autoprefixer-rails'

#middle
gem 'activeadmin',         github: 'gregbell/active_admin', ref: '65aae6b68e78aad3071b2f85242b19fd3fccf426'
gem 'activeadmin-mongoid', github: 'elia/activeadmin-mongoid', branch: 'rails4'
gem 'activeadmin-sortable'
gem 'activeadmin_images'
gem 'activeadmin_tinymce'

#back

# models extensions
gem 'mongoid-paperclip', require: 'mongoid_paperclip'
gem 'mongoid_slug'
gem 'mongoid_orderable'
gem 'mongoid_acts_as_page', '~> 0.5.1'


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
  gem 'coveralls'
  gem 'simplecov'
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
