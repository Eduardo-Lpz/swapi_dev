# frozen_string_literal: true

require "test_helper"
require "net/http"

module SwapiDev
  class FilmTest < Minitest::Test
    def params
      {
        format: :wookiee,
        page: 1,
        search: "a new hope"
      }
    end

    def format_error
      { detail: "Not found", message: "NOT FOUND", code: "404" }
    end

    def resource
      Film.new
    end

    def films
      {
        count: 1,
        next: nil,
        previous: nil,
        results: [film]
      }
    end

    def film
      {
        title: "A New Hope",
        episode_id: 4,
        opening_crawl: "It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\n",
        director: "George Lucas",
        producer: "Gary Kurtz, Rick McCallum",
        release_date: "1977-05-25",
        characters: [
          "https://swapi.dev/api/people/1/"
        ],
        planets: [
          "https://swapi.dev/api/planets/3/"
        ],
        starships: [
          "https://swapi.dev/api/starships/2/"
        ],
        vehicles: [
          "https://swapi.dev/api/vehicles/4/",
          "https://swapi.dev/api/vehicles/6/",
          "https://swapi.dev/api/vehicles/7/",
          "https://swapi.dev/api/vehicles/8/"
        ],
        species: [
          "https://swapi.dev/api/species/1/",
          "https://swapi.dev/api/species/2/",
          "https://swapi.dev/api/species/3/"
        ],
        created: "2014-12-10T14:23:31.880000Z",
        edited: "2014-12-20T19:49:45.256000Z",
        url: "https://swapi.dev/api/films/1/"
      }
    end

    def test_film_class_must_exist
      refute_nil resource
    end

    def test_must_get_film
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(film),
        status: [200, "OK"]
      )

      response = SwapiDev.films(search: "a new hope")
      assert_instance_of Hash, response
    end

    def test_must_fail_when_format_is_invalid
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(format_error)
      )

      response = SwapiDev.film_id(1, format: :not_wookiee)
      assert_equal "404", response[:code]
    end
  end
end
