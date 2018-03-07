source 'https://rubygems.org'

ruby '2.4.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
# an asset gemification of the font-awesome icon font library (https://github.com/bokmann/font-awesome-rails)
gem "font-awesome-rails"
# bootstrap-sass is a Sass-powered version of Bootstrap 3, ready to drop right into your Sass powered applications. (https://github.com/twbs/bootstrap-sass)
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem 'will_paginate-bootstrap'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
gem 'jquery-minicolors-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Flexible authentication solution for Rails
# https://github.com/plataformatec/devise
gem 'devise'
gem "simple_form"
gem 'selectize-rails'
gem "nested_form"
gem 'toastr-rails',                     '1.0.3'

# Easiest way to add multi-environment yaml settings to Rails, Sinatra, Pandrino and other ruby projects. (https://github.com/railsconfig/config)
gem 'config'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'mailcatcher'

  # factory_girl_rails provides integration between factory_girl and rails 3 (http://github.com/thoughtbot/factory_girl_rails)
  gem 'factory_girl_rails'
  # Easily generate fake data (https://github.com/stympy/faker)
  # RSpec for Rails (http://github.com/rspec/rspec-rails)
  #gem 'rspec-rails', '~> 3.0.0.beta1'
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'thin'
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'heroku'
# seed migrations
# Rails Data Migration (http://github.com/harrystech/seed_migration)
gem 'seed_migration'
gem 'faker'

group :test do
  gem 'rspec'
  gem 'database_cleaner'
  gem 'test-unit'
  gem 'webmock'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git'#, branch: 'rails-5'
  gem 'rails-controller-testing'
end
