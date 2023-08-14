# frozen_string_literal: true

require "test_helper"
require "net/http"

module SwapiDev
  class PeopleTest < Minitest::Test
    def params
      {
        format: :wookiee,
        page: 1,
        search: "Luke"
      }
    end

    def format_error
      { detail: "Not found", message: "NOT FOUND", code: "404" }
    end

    def resource
      People.new
    end

    def people
      {
        count: 1,
        next: nil,
        previous: nil,
        results: [person]
      }
    end

    def person
      {
        name: "Luke Skywalker",
        height: "172",
        mass: "77",
        hair_color: "blond",
        skin_color: "fair",
        eye_color: "blue",
        birth_year: "19BBY",
        gender: "male",
        homeworld: "https://swapi.dev/api/planets/1/",
        films: ["https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/",
                "https://swapi.dev/api/films/6/"],
        species: [],
        vehicles: ["https://swapi.dev/api/vehicles/14/", "https://swapi.dev/api/vehicles/30/"],
        starships: ["https://swapi.dev/api/starships/12/", "https://swapi.dev/api/starships/22/"],
        created: "2014-12-09T13:50:51.644000Z",
        edited: "2014-12-20T21:17:56.891000Z",
        url: "https://swapi.dev/api/people/1/"
      }
    end

    def test_people_class_must_exist
      refute_nil resource
    end

    def test_must_get_people
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(people),
        status: [200, "OK"]
      )

      response = SwapiDev.people(search: "luke")
      assert_instance_of Hash, response
    end

    def test_must_fail_when_format_is_invalid
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(format_error)
      )

      response = SwapiDev.people_id(1, format: :not_wookiee)
      assert_equal "404", response[:code]
    end
  end
end
