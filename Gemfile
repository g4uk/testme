# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.12'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS),
# making cross-origin AJAX possible
gem 'rack-cors', '~> 1.0.3'

gem 'graphql', '~> 1.9.10'

group :development, :test do
  gem 'byebug', '~> 11.0.1'

  gem 'database_cleaner', '~> 1.7'
  gem 'factory_bot_rails', '~> 5.0.2'
  gem 'faker', '~> 2.1.2'

  gem 'rspec-rails', '~> 3.8.2'

  # Linters
  gem 'rubocop', '~> 0.73'
  gem 'rubocop-performance', '~> 1.3'
  gem 'rubocop-rspec', '~> 1.33.0'

  gem 'simplecov', '0.17.0', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application
  # running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'graphiql-rails', '~> 1.7'
end
