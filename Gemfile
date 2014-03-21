source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.0.4'

# assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'

# frontend
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'font-awesome-rails'
gem 'slim-rails'
gem 'simple_form'
gem 'bootstrap-datepicker-rails'
gem 'cocoon'
gem 'actionview-encoded_mail_to'
gem 'tinymce-rails'

# backend
gem 'pg'
gem 'puma'
gem 'devise'
gem 'quicklog'
gem 'paperclip'
gem 'marco-polo'
gem 'ranked-model'
gem 'aws-sdk'
gem 'rollbar'
gem 'sucker_punch'

group :development, :test do
  gem 'dotenv-rails'
end

group :development do
  gem 'quiet_assets'
  gem 'jazz_hands'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'guard-ctags-bundler'
  gem 'guard-test'

  gem 'overcommit', require: false
  gem 'scss-lint', '0.7.0', require: false

  gem 'mails_viewer'

  gem 'byebug'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'single_test'
  gem 'temping'
end

gem 'rails_12factor', group: :production
gem 'newrelic_rpm'
