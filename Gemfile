source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'activerecord-postgis-adapter', '~> 6.0.0'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'dalli'
gem 'delivery_boy'
gem 'jbuilder', '~> 2.7'
gem 'racecar'
gem 'redis', '~> 4.0'
gem 'ruby-kafka'
gem 'oj'
gem 'pg', '~> 1.2.3'
gem 'puma', '~> 4.3.5'
gem 'rails', '~> 6.0.3.4'
gem 'sass-rails', '>= 6'
gem 'sidekiq', '~> 6.1.2'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'faker'
  gem 'htmlbeautifier'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop-rails', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
