# frozen_string_literal: true

require "test_helper"
require "net/http"

module SwapiDev
  class SpecieTest < Minitest::Test
    def params
      {
        format: :wookiee,
        page: 1,
        search: "human"
      }
    end

    def format_error
      { detail: "Not found", message: "NOT FOUND", code: "404" }
    end

    def resource
      Specie.new
    end

    def species
      {
        count: 1,
        next: nil,
        previous: nil,
        results: [specie]
      }
    end

    def specie
      {
        name: "Human",
        classification: "mammal",
        designation: "sentient",
        average_height: "180",
        skin_colors: "caucasian, black, asian, hispanic",
        hair_colors: "blonde, brown, black, red",
        eye_colors: "brown, blue, green, hazel, grey, amber",
        average_lifespan: "120",
        homeworld: "https://swapi.dev/api/planets/9/",
        language: "Galactic Basic",
        people: [
          "https://swapi.dev/api/people/66/",
          "https://swapi.dev/api/people/67/",
          "https://swapi.dev/api/people/68/",
          "https://swapi.dev/api/people/74/"
        ],
        films: [
          "https://swapi.dev/api/films/1/",
          "https://swapi.dev/api/films/2/",
          "https://swapi.dev/api/films/3/",
          "https://swapi.dev/api/films/4/",
          "https://swapi.dev/api/films/5/",
          "https://swapi.dev/api/films/6/"
        ],
        created: "2014-12-10T13:52:11.567000Z",
        edited: "2014-12-20T21:36:42.136000Z",
        url: "https://swapi.dev/api/species/1/"
      }
    end

    def test_specie_class_must_exist
      refute_nil resource
    end

    def test_must_get_specie
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(specie),
        status: [200, "OK"]
      )

      response = SwapiDev.species(search: "human")
      assert_instance_of Hash, response
    end

    def test_must_fail_when_format_is_invalid
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(format_error)
      )

      response = SwapiDev.specie_id(1, format: :not_wookiee)
      assert_equal "404", response[:code]
    end
  end
end
