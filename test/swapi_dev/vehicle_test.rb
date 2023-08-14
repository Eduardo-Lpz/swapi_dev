# frozen_string_literal: true

require "test_helper"
require "net/http"

module SwapiDev
  class VehicleTest < Minitest::Test
    def params
      {
        format: :wookiee,
        page: 1,
        search: "Sand Crawler"
      }
    end

    def format_error
      { detail: "Not found", message: "NOT FOUND", code: "404" }
    end

    def resource
      Vehicle.new
    end

    def vehicles
      {
        count: 1,
        next: nil,
        previous: nil,
        results: [vehicle]
      }
    end

    def vehicle
      {
        name: "Sand Crawler",
        model: "Digger Crawler",
        manufacturer: "Corellia Mining Corporation",
        cost_in_credits: "150000",
        length: "36.8 ",
        max_atmosphering_speed: "30",
        crew: "46",
        passengers: "30",
        cargo_capacity: "50000",
        consumables: "2 months",
        vehicle_class: "wheeled",
        pilots: [],
        films: [
          "https://swapi.dev/api/films/1/",
          "https://swapi.dev/api/films/5/"
        ],
        created: "2014-12-10T15:36:25.724000Z",
        edited: "2014-12-20T21:30:21.661000Z",
        url: "https://swapi.dev/api/vehicles/4/"
      }
    end

    def test_vehicle_class_must_exist
      refute_nil resource
    end

    def test_must_get_vehicle
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(vehicle),
        status: [200, "OK"]
      )

      response = SwapiDev.vehicles(search: "Sand Crawler")
      assert_instance_of Hash, response
    end

    def test_must_fail_when_format_is_invalid
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(format_error)
      )

      response = SwapiDev.vehicle_id(1, format: :not_wookiee)
      assert_equal "404", response[:code]
    end
  end
end
