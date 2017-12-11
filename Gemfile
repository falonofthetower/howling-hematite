source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '~> 4.2.5'
gem 'haml-rails'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'pg'
gem 'bootstrap_form'
gem 'figaro'
gem 'puma'
gem 'sentry-raven'
gem 'bcrypt'
gem 'braintree'
gem 'gon'
gem 'sidekiq'
gem 'gibbon'
gem 'rake', '< 11.0'
gem "font-awesome-rails"

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'shoulda-matchers' #, require: false
  gem 'rspec-rails', '2.99'
  gem 'capybara'
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
  gem 'letter_opener_web'
end

group :test do
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'faker'
  gem 'vcr'
  gem 'selenium-webdriver'
  gem 'poltergeist'
  gem 'webmock'
  gem 'launchy'
end

group :production, :staging do
  gem 'rails_12factor'
  gem 'raygun4ruby'
end
