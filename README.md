## Rails 5 API starter

<b style='color: orange; font-size: 14pt;'>Rails 5 API starter</b> is a boilerplate which helps you build fast, secure and efficient API for applications. Template based on automatically generated structure of directory and settings which are default delivered by --api switch. Additional to settings are added and initially configure useful Gems, which are often used in Rails stack application.

<p align="center">
<img src="https://s3-eu-west-1.amazonaws.com/hawatel-github/rails5-api-starter/main.png">
</p>

## Features

- [omniauth](https://github.com/intridea/omniauth )
- [devise](https://github.com/plataformatec/devise)
- [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth)
- [jbuilder](https://github.com/rails/jbuilder)
- [rspec-api-documentation](https://github.com/zipmark/rspec_api_documentation )
- [yard](https://github.com/lsegal/yard)
- [rspec-rails](https://github.com/rspec/rspec-rails)
- [json_spec](https://github.com/collectiveidea/json_spec)
- [factory-girl](https://github.com/thoughtbot/factory_girl)
- [faker]( https://github.com/stympy/faker)
- [simpleconv](https://github.com/colszowka/simplecov)
- [rack-attacker](https://github.com/kickstarter/rack-attack )
- [rack-timeout]( https://github.com/heroku/rack-timeout)
- [readthis](https://github.com/sorentwo/readthis)
- [hiredis](https://github.com/redis/hiredis)
- [spirng](https://github.com/rails/spring )
- [better_errors](https://github.com/charliesome/better_errors)
- [awesome_print](https://github.com/awesome-print/awesome_print)
- [rails_panel](https://github.com/dejan/rails_panel)
- [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)
- [sidekiq](https://github.com/mperham/sidekiq)


### Installation process

##### Requirements

Boilerplate based on Docker container. To start using them, first, we have to make sure that Docker Engine and Docker compose tool are installed.

- Compose 1.6.0+ 
- Docker Engine 1.10.0+ 
 
##### Build

```
$ git git@github.com:Hawatel/rails5-api-starter.git
$ docker-compose build
$ docker-compose run web bundle
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
```

### Getting Started

To start the server you only need to run the following magic command: 

```
$ docker-compose up
```

#### Rename project

It is only necessary from the perspective of the framework to change the application name in config/application.rb file.

```
...
module HawatelApi5Starterkit                      # CHANGE HERE                      
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Use Rack Attack
    config.middleware.use Rack::Attack
  end
end
```

#### Update Gemset 

To avoid install gems from scratch in each time when Gemfile will be updated, boilerplate has implemented persistent, cross-container dedicated volume for gems. 
Now in case when new entry to Gemfile is added, just run below command to update state: 

```
$ docker-compose run web bundle
```

#### Debugging

##### Rails in Chrome

RailsPanel is a Chrome extension for Rails development that will end your tailing of development.log. Have all information about your Rails app requests right there in the Developer Tools panel. 
To use this you will need to install Chrome extension from this [link](https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg) .


### RSpec

Running your test suite is done quite easily. You have to just set RAILS_ENV to test and execute rspec command the same way you would run your tests locally: 

```
$ docker-compose run -e "RAILS_ENV=test" rspec
```

In case when you need initialize or migrate database in test env call rails db:create or db:migrate: 

```
$ docker-compose run -e "RAILS_ENV=test" web rails db:create
$ docker-compose run -e "RAILS_ENV=test" web rails db:migrate
```


## License

The Starter Kit is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Useful links
- https://labs.omniti.com/labs/jsend
- http://jsonapi.org/

## TODO
- https://github.com/phatworx/devise_security_extension - Add Devise security extension


