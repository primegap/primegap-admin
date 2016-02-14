source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '4.2.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'

gem 'activeadmin', '~> 1.0.0.pre2'
gem 'devise' # ActiveAdmin dependency

# Primegap Gems
gem 'primegap-core', github: 'primegap/primegap-core', branch: 'master'

group :production do
  gem 'puma'
  gem 'pg'
  gem 'rails_12factor' # heroku support
  gem 'newrelic_rpm'
end

group :development do
  gem 'spring'
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'sqlite3'
  gem 'codeclimate-test-reporter', require: nil
  gem 'capybara'
end

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.3'
  gem 'shoulda-matchers', '~> 3.0'
  gem 'factory_girl_rails'
end
