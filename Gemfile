source 'https://rubygems.org'

ruby '2.2.1'

# the most important stuff
gem 'rails'
gem 'pg'

# all other gems
gem 'responders'
gem 'thin'
gem 'decent_exposure'
gem 'seedbank'
gem 'devise'
gem 'kaminari'
gem 'dotenv-rails'
gem 'active_model_serializers'
gem 'interactor-rails'
gem 'rack-cors', require: 'rack/cors'

group :development do
  gem 'letter_opener'
  gem 'foreman'
  gem 'bullet'

  gem 'guard-rspec'
  gem 'rb-fsevent', require: false
  gem 'zeus'
end

group :development, :test do
  gem 'minitest'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'mail_safe'

  gem 'rails_best_practices'
  gem 'brakeman'
  gem 'rubocop'
  gem 'bundler-audit'
  gem 'pry-rails'
  gem 'rails-erd'
end

group :test do
  gem 'simplecov', require: false
  gem 'webmock', require: false

  gem 'database_cleaner'
  gem 'email_spec'
  gem 'shoulda-matchers'
  gem 'json_spec'
end

group :development, :test, :staging do
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'rspec_api_documentation'
  gem 'apitome'
end

group :staging, :production do
  gem 'rollbar'
  gem 'rails_12factor'
end
