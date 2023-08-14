# frozen_string_literal: true

require "test_helper"
require "net/http"

module SwapiDev
  class PlanetTest < Minitest::Test
    def params
      {
        format: :wookiee,
        page: 1,
        search: "tatooine"
      }
    end

    def format_error
      { detail: "Not found", message: "NOT FOUND", code: "404" }
    end

    def resource
      Planet.new
    end

    def planets
      {
        count: 1,
        next: nil,
        previous: nil,
        results: [planet]
      }
    end

    def planet
      {
        name: "Tatooine",
        rotation_period: "23",
        orbital_period: "304",
        diameter: "10465",
        climate: "arid",
        gravity: "1 standard",
        terrain: "desert",
        surface_water: "1",
        population: "200000",
        residents: [
          "https://swapi.dev/api/people/1/",
          "https://swapi.dev/api/people/2/",
          "https://swapi.dev/api/people/4/",
          "https://swapi.dev/api/people/6/",
          "https://swapi.dev/api/people/7/",
          "https://swapi.dev/api/people/8/",
          "https://swapi.dev/api/people/9/",
          "https://swapi.dev/api/people/11/",
          "https://swapi.dev/api/people/43/",
          "https://swapi.dev/api/people/62/"
        ],
        films: [
          "https://swapi.dev/api/films/1/",
          "https://swapi.dev/api/films/3/",
          "https://swapi.dev/api/films/4/",
          "https://swapi.dev/api/films/5/",
          "https://swapi.dev/api/films/6/"
        ],
        created: "2014-12-09T13:50:49.641000Z",
        edited: "2014-12-20T20:58:18.411000Z",
        url: "https://swapi.dev/api/planets/1/"
      }
    end

    def test_planet_class_must_exist
      refute_nil resource
    end

    def test_must_get_planet
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(planet),
        status: [200, "OK"]
      )

      response = SwapiDev.planets(search: "tatooine")
      assert_instance_of Hash, response
    end

    def test_must_fail_when_format_is_invalid
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(format_error)
      )

      response = SwapiDev.planet_id(1, format: :not_wookiee)
      assert_equal "404", response[:code]
    end
  end
end
