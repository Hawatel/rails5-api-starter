source 'https://rubygems.org'

# Rails
gem 'rails', '5.0.0'
gem 'grape'
#gem 'rack-cors', :require => 'rack/cors'
gem 'rack-cors', '~> 0.4.0'
gem 'grape-active_model_serializers'
gem 'grape-swagger'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
gem 'pg', '0.20'
gem 'slim'
# Use Puma as the app server
gem 'puma', '~> 3.0'

# Security, limit number request per second. Read more: https://github.com/kickstarter/rack-attack
gem 'rack-attack'

# Build JSON APIs with ease.
# Read more: https://github.com/rails/jbuilder
gem 'jbuilder', :git => 'git://github.com/diwaniuk/jbuilder.git'

# Faster rendering JSON file.
# Read more: https://github.com/brianmario/yajl-ruby
gem 'yajl-ruby', require: 'yajl'

# Schema validation
# https://github.com/ruby-json-schema/json-schema
gem 'json-schema'

# Timeout for long-running request
gem 'rack-timeout'

# Token based authentication for Rails JSON APIs
gem 'devise_token_auth'
gem 'omniauth'

# CanCan is an authorization library for Ruby on Rails which restricts what resources a given user is allowed to access.
gem 'cancancan'

# Faster & modern implementation of client to integrate Rails with Redis
# configuration in: config/initializers/readthis.rb (Fault Tolerant enable)
# Read more: https://github.com/sorentwo/readthis
gem 'redis'
gem 'readthis'
gem 'hiredis'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
#gem 'rack-cors'

# Sidekiq as delay job manager
gem 'sidekiq', '~> 4.1.2'

# Cron for JOBS. Read more: https://github.com/ondrejbartas/sidekiq-cron
gem 'sidekiq-cron', '~> 0.4.0'
gem 'sidekiq-failures', '~> 0.4.5'
gem 'sidekiq-statistic'
gem 'sinatra', github: 'sinatra/sinatra', branch: 'master'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry'
  gem 'pry-byebug'
  gem 'byebug', platform: :mri

  # Read more: https://github.com/collectiveidea/json_spec
  gem 'json_spec'
   gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
  gem 'action-cable-testing'
  # Read more: https://github.com/charliesome/better_errors
  # gem "better_errors"
  # gem 'binding_of_caller'

  # Read more: https://github.com/awesome-print/awesome_print
  # run ap User.all to see afect
  gem "awesome_print", require:"ap"

  # Integrate Rails project with Rails Panel (chrome extension)
  # Read More: https://github.com/dejan/rails_panel
  gem 'meta_request'

  # Use RSpec for specs
  gem "rspec-rails"

  # Automatic generate API documentation based on comments in RSpec
  gem 'rspec_api_documentation'

  # RSpec coverage
  gem 'simplecov', :require => false

  # Faker
  gem 'faker'

  # Use Factory Girl for generating random test data
  #gem 'factory_girl_rails'

  # Fake email
  gem "letter_opener",:require => false

end

group :development do
  gem 'listen', '~> 3.0.5'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # JSON Schema tooling
  # Read more:
  # - https://github.com/interagent/prmd
  # - https://spacetelescope.github.io/understanding-json-schema/index.html
  # gem 'prmd'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'tzinfo-data', platforms: [:mingw, :mswin]