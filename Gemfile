source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'aasm', '~> 4.11'
gem 'activeadmin', '~> 1.2'
gem 'activeadmin_addons'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.4'
gem 'enumerize', '~> 2.1'
gem 'font-awesome-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'simple_form', '~> 3.5'
gem 'slim', '~> 3.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'sendgrid-ruby'
gem 'smtpapi'
gem 'dotenv-rails', groups: [:development, :test]

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'letter_opener'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'sidekiq'
group :test do
  gem 'capybara', '2.14.0'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  gem 'simplecov'
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
end
