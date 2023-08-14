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

You will find methods for 6 diferent Resources, all of them with the same behavior:
- Planets
- Starships
- Vehicles
- People
- Films
- Species
#### Example using People

```ruby
SwapiDev.people # accepts: format, page, search
SwapiDev.people_id(some_id) # accepts: format
```

## Searching
All searches will use case-insensitive partial matches on the set of search fields.

```ruby
# people search
SwapiDev.people(search: "Luke Skywalker")
# vehicle search
SwapiDev.vehicle(search: "Sand Crawler")
```

To see the set of search fields for each resource, check the table below:

<table>
  <tr>
    <td><b>Resource</b></td>
    <td><b>Fields</b></td>
  </tr>
  <tr>
    <td>People</td>
    <td>name</td>
  </tr>
  <tr>
    <td>Films</td>
    <td>title</td>
  </tr>
  <tr>
    <td>Starships</td>
    <td>name, model</td>
  </tr>
  <tr>
    <td>Vehicles</td>
    <td>name, model</td>
  </tr>
  <tr>
    <td>Species</td>
    <td>name</td>
  </tr>
  <tr>
    <td>Planets</td>
    <td>name</td>
  </tr>
</table>

## Pagination
You can pass a `page` argument if you want to get specific page.

```ruby
SwapiDev.people(page: 2)
```

## Format
This encoding is identical to JSON except with wookiee translations. All methods accept wookiee format keyword.
```ruby
SwapiDev.people(format: :wookie)
SwapiDev.people(search: "Luke", format: :wookie)
SwapiDev.people_id(1, format: :wookie)
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Eduardo-Lpz/swapi_dev. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/swapi_dev/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SwapiDev project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/swapi_dev/blob/master/CODE_OF_CONDUCT.md).
