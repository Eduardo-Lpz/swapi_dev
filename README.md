# SwapiDev

A Ruby wrapper for the Star Wars API

# RubyGem

[https://rubygems.org/gems/swapi_dev](https://rubygems.org/gems/swapi_dev)


# Api documentation
here is the documentation of [The Star War API](https://swapi.dev/)
# Installation

Add this line to your application's Gemfile:

```ruby
gem 'swapi_dev'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install swapi_dev

# Usage

First you need to require the gem

```ruby
require "swapi_dev"
```

## Methods

There is 6 diferents statistics to request
### People

```ruby
SwapiDev.people_all
SwapiDev.people_id(id)
SwapiDev.people_name(name)
```

### Films

```ruby
SwapiDev.film_all
SwapiDev.film_id(id)
SwapiDev.film_title(title)
```

### Planets

```ruby
SwapiDev.planet_all
SwapiDev.planet_id(id)
SwapiDev.planet_name(name)
```

### Species

```ruby
SwapiDev.specie_all
SwapiDev.specie_id(id)
SwapiDev.specie_name(name)
```

### Starships

```ruby
SwapiDev.starship_all
SwapiDev.starship_id(id)
SwapiDev.starship_name(name)
SwapiDev.starship_model(model)
```

### Vehicles

```ruby
SwapiDev.vehicle_all
SwapiDev.vehicle_id(id)
SwapiDev.vehicle_name(name)
SwapiDev.vehicle_model(model)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Eduardo-Lpz/swapi_dev. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/swapi_dev/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SwapiDev project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/swapi_dev/blob/master/CODE_OF_CONDUCT.md).
