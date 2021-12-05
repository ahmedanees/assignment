# frozen_string_literal: true

source 'https://rubygems.org'
source 'https://rails-assets.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.4.0'
gem 'uuid', '~> 2.3', '>= 2.3.8'
gem 'jwt'
gem 'pg'
gem 'puma'
gem 'rails', '~> 5.2.0'
gem 'curb'
gem 'sidekiq'
gem 'redis', '>= 4.0.1'
gem 'serviceworker-rails'


group :development do
  gem 'better_errors'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'mock_redis'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'webmock'
end

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'hirb'
  gem 'pry'
  gem 'rspec-mocks'
  gem 'rspec-rails'
end
