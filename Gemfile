source "https://rubygems.org"

ruby "3.3.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :development, :test do
  # Factory Bot Rails provides a set of factories for testing [https://github.com/thoughtbot/factory_bot_rails]
  gem 'factory_bot_rails'

  # RSpec Rails is a testing framework for Rails applications [https://github.com/rspec/rspec-rails]
  gem 'rspec-rails'

  # Rails Controller Testing provides a set of helpers for testing Rails controllers [https://github.com/rails/rails-controller-testing]
  gem 'rails-controller-testing'

  # pg is a Ruby interface to the PostgreSQL RDBMS [https://github.com/ged/ruby-pg]
  gem 'pg'
end

# Devise is a flexible authentication solution for Rails [https://github.com/heartcombo/devise]
gem "devise"

# Devise JWT is a JSON Web Token authentication strategy for Devise [https://github.com/waiting-for-dev/devise-jwt]
gem "devise-jwt"
