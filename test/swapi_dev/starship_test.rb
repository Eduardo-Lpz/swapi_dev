# frozen_string_literal: true

require "test_helper"
require "net/http"

module SwapiDev
  class StarshipTest < Minitest::Test
    def starship
      Starship.new
    end

    def test_starship_all_must_return_a_hash
      body = {
        count: 36,
        next: "https://swapi.dev/api/starships/?page=2",
        previous: nil,
        results: [
          {
            name: "Rebel transport",
            model: "GR-75 medium transport",
            manufacturer: "Gallofree Yards, Inc.",
            cost_in_credits: "unknown",
            length: "90",
            max_atmosphering_speed: "650",
            crew: "6",
            passengers: "90",
            cargo_capacity: "19000000",
            consumables: "6 months",
            hyperdrive_rating: "4.0",
            MGLT: "20",
            starship_class: "Medium transport",
            pilots: [],
            films: ["https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/"],
            created: "2014-12-15T12:34:52.264000Z",
            edited: "2014-12-20T21:23:49.895000Z",
            url: "https://swapi.dev/api/starships/17/"
          }
        ]
      }

      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(body),
        status: [200, "OK"]
      )

      assert_instance_of Array, starship.all
    end
  end
end
