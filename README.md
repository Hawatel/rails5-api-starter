## Rails 5 API starter

<b style='color: orange; font-size: 14pt;'>Rails 5 API starter</b> is a boilerplate which helps you build fast, secure and efficient API for applications. Template based on automatically generated structure of directory and settings which are default delivered by --api switch. Additional to settings are added and initially configure useful Gems, which are often used in Rails stack application.

**NOTE:** The template is still in the development version. Don't use in production!


## Features

- [omniauth](https://github.com/intridea/omniauth )
- [devise](https://github.com/plataformatec/devise)
- [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth)
- [jbuilder](https://github.com/rails/jbuilder)
- [rspec-api-documentation](https://github.com/zipmark/rspec_api_documentation )
- [yard](https://github.com/lsegal/yard)
- [rspec-rails](https://github.com/rspec/rspec-rails)
- [factory-girl](https://github.com/thoughtbot/factory_girl)
- [faker]( https://github.com/stympy/faker)
- [simpleconv](https://github.com/colszowka/simplecov)
- [rack-attacker](https://github.com/kickstarter/rack-attack )
- [rack-timeout]( https://github.com/heroku/rack-timeout)
- [readthis](https://github.com/sorentwo/readthis)
- [hiredis](https://github.com/redis/hiredis)
- [spirng](https://github.com/rails/spring )

## Installation
```
$ git git@github.com:Hawatel/rails-api-starter.git
$ bundel install
```

## Usage

|Command|Description|
|---|---|
|`bin/rails s -e development`|start development server on `localhost:3000`|
|`bin/rails s -e production`|start production server on `localhost:3000`.|
|`bin/rails spec:docs `|generate API docs files. Output is saved in to docs directory.|
|`bin/rails dev:cache`|enable/disable cache mode|
|`bin/rails spec`|run spec tests|


## License

The Starter Kit is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Useful links
- https://labs.omniti.com/labs/jsend
- http://jsonapi.org/

## TODO
- https://github.com/phatworx/devise_security_extension - Add Devise security extension
- Delete deprecation warnings from RSpec


