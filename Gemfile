source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.4.1'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', require: false
  gem 'spring-watcher-listen', '~> 2.0.0', require: false
  gem 'web-console', '>= 3.3.0'
end
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'devise'
gem 'high_voltage'
gem 'jquery-rails'
gem 'pg'
gem 'slim-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'factory_girl_rails'
  gem 'pry-byebug'
end
gem 'faker'

group :test do
  gem 'capybara'
  gem 'capybara-email'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'launchy'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'rspec-json_expectations'
end

group :development do
  gem 'better_errors'
  gem 'pry-rails'
  gem 'rails_layout'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring-commands-rspec', require: false
  gem 'guard', require: false
  gem 'guard-spring', require: false
  gem 'guard-rspec', require: false
end

gem 'doorkeeper'
gem 'responders'
gem 'active_model_serializers', '~> 0.10.0'
gem 'will_paginate', '~> 3.1.0'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
