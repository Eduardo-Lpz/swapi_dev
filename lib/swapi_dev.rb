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
require_relative "swapi_dev/serializers/wookiee_serializer"

require_relative "swapi_dev/resources/people"
require_relative "swapi_dev/resources/starship"
require_relative "swapi_dev/resources/film"
require_relative "swapi_dev/resources/planet"
require_relative "swapi_dev/resources/vehicle"
require_relative "swapi_dev/resources/specie"

module SwapiDev
  class Error < StandardError; end

  def self.people_all
    People.new.all
  end

  def self.people_id(id)
    People.new.find(id)
  end

  def self.people_name(name)
    People.new.search(name)
  end

  def self.film_all
    Film.new.all
  end

  def self.film_id(id)
    Film.new.find(id)
  end

  def self.film_title(name)
    Film.new.search(name)
  end

  def self.planet_all
    Planet.new.all
  end

  def self.planet_id(id)
    Planet.new.find(id)
  end

  def self.planet_name(name)
    Planet.new.search(name)
  end

  def self.specie_all
    Specie.new.all
  end

  def self.specie_id(id)
    Specie.new.find(id)
  end

  def self.specie_name(name)
    Specie.new.search(name)
  end

  def self.starship_all
    Starship.new.all
  end

  def self.starship_id(id)
    Starship.new.find(id)
  end

  def self.starship_name(name)
    Starship.new.search(name)
  end

  def self.starship_model(model)
    Starship.new.search(model)
  end

  def self.vehicle_all
    Vehicle.new.all
  end

  def self.vehicle_id(id)
    Vehicle.new.find(id)
  end

  def self.vehicle_name(name)
    Vehicle.new.search(name)
  end

  def self.vehicle_model(model)
    Vehicle.new.search(model)
  end
end
