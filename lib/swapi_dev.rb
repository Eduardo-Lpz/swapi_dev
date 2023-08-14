# frozen_string_literal: true

require_relative "swapi_dev/version"

require_relative "swapi_dev/client/client"
require_relative "swapi_dev/client/uri_builder"
require_relative "swapi_dev/client/endpoint"
require_relative "swapi_dev/client/response"
require_relative "swapi_dev/client/async_stream"

require_relative "swapi_dev/serializers/base_serializer"
require_relative "swapi_dev/serializers/error_serializer"
require_relative "swapi_dev/serializers/json_serializer"

require_relative "swapi_dev/resources/people"
require_relative "swapi_dev/resources/starship"
require_relative "swapi_dev/resources/film"
require_relative "swapi_dev/resources/planet"
require_relative "swapi_dev/resources/vehicle"
require_relative "swapi_dev/resources/specie"

module SwapiDev
  class Error < StandardError; end

  def self.people(**args)
    People.new.all(**args)
  end

  def self.people_id(id, **args)
    People.new.find_id(id, **args.slice(:format))
  end

  def self.films(**args)
    Film.new.all(**args)
  end

  def self.film_id(id, **args)
    Film.new.find_id(id, **args.slice(:format))
  end

  def self.planets(**args)
    Planet.new.all(**args)
  end

  def self.planet_id(id, **args)
    Planet.new.find_id(id, **args.slice(:format))
  end

  def self.species(**args)
    Specie.new.all(**args)
  end

  def self.specie_id(id, **args)
    Specie.new.find_id(id, **args.slice(:format))
  end

  def self.starships(**args)
    Starship.new.all(**args)
  end

  def self.starship_id(id, **args)
    Starship.new.find_id(id, **args.slice(:format))
  end

  def self.vehicles(**args)
    Vehicle.new.all(**args)
  end

  def self.vehicle_id(id, **args)
    Vehicle.new.find_id(id, **args.slice(:format))
  end
end
