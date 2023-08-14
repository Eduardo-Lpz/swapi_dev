# frozen_string_literal: true

require "test_helper"
require "net/http"

module SwapiDev
  class StarshipTest < Minitest::Test
    def params
      {
        format: :wookiee,
        page: 1,
        search: "corvette"
      }
    end

    def format_error
      { detail: "Not found", message: "NOT FOUND", code: "404" }
    end

    def resource
      Starship.new
    end

    def starships
      {
        count: 1,
        next: nil,
        previous: nil,
        results: [starship]
      }
    end

    def starship
      {
        name: "CR90 corvette",
        model: "CR90 corvette",
        manufacturer: "Corellian Engineering Corporation",
        cost_in_credits: "3500000",
        length: "150",
        max_atmosphering_speed: "950",
        crew: "30-165",
        passengers: "600",
        cargo_capacity: "3000000",
        consumables: "1 year",
        hyperdrive_rating: "2.0",
        MGLT: "60",
        starship_class: "corvette",
        pilots: [],
        films: [
          "https://swapi.dev/api/films/1/",
          "https://swapi.dev/api/films/3/",
          "https://swapi.dev/api/films/6/"
        ],
        created: "2014-12-10T14:20:33.369000Z",
        edited: "2014-12-20T21:23:49.867000Z",
        url: "https://swapi.dev/api/starships/2/"
      }
    end

    def test_starship_class_must_exist
      refute_nil resource
    end

    def test_must_get_starship
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(starship),
        status: [200, "OK"]
      )

      response = SwapiDev.starships(search: "corvette")
      assert_instance_of Hash, response
    end

    def test_must_fail_when_format_is_invalid
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(format_error)
      )

      response = SwapiDev.starship_id(1, format: :not_wookiee)
      assert_equal "404", response[:code]
    end
  end
end
