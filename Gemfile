source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.1'

# assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

# frontend
gem 'jquery-rails'
gem 'turbolinks'
gem 'slim-rails'

# backend
gem 'pg'
gem 'devise'

group :development, :test do
  gem 'dotenv-rails'
end

group :development do
  gem 'quicklog'
  gem 'quiet_assets'
  gem 'jazz_hands'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'guard-ctags-bundler'

  gem 'overcommit', require: false
  gem 'scss-lint', '0.7.0', require: false
end

group :test do
  gem 'capybara'
  gem 'launchy'
end
