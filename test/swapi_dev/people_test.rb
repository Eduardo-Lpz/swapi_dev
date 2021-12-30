# frozen_string_literal: true

require "test_helper"
require "net/http"

module SwapiDev
  class PeopleTest < Minitest::Test
    def people
      People.new
    end

    def test_people_class_must_exist
      refute_nil people
    end

    def test_people_search
      body = {
        count: 1,
        next: nil,
        previous: nil,
        results: [
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
            films: ["https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/6/"],
            species: [],
            vehicles: ["https://swapi.dev/api/vehicles/14/", "https://swapi.dev/api/vehicles/30/"],
            starships: ["https://swapi.dev/api/starships/12/", "https://swapi.dev/api/starships/22/"],
            created: "2014-12-09T13:50:51.644000Z",
            edited: "2014-12-20T21:17:56.891000Z",
            url: "https://swapi.dev/api/people/1/"
          }
        ]
      }

      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(body),
        status: [200, "OK"]
      )
      response = people.search("Luke Skywalker")
      assert_instance_of Hash, response
    end

    def test_people_find_must_return_a_hash
      body = {
        name: "Luke Skywalker",
        height: "172",
        mass: "77",
        hair_color: "blond",
        skin_color: "fair",
        eye_color: "blue",
        birth_year: "19BBY",
        gender: "male",
        homeworld: "https://swapi.dev/api/planets/1/",
        films: ["https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/6/"],
        species: [],
        vehicles: ["https://swapi.dev/api/vehicles/14/", "https://swapi.dev/api/vehicles/30/"],
        starships: ["https://swapi.dev/api/starships/12/", "https://swapi.dev/api/starships/22/"],
        created: "2014-12-09T13:50:51.644000Z",
        edited: "2014-12-20T21:17:56.891000Z",
        url: ": tps://swapi.dev/api/people/1/"
      }
      stub_request(:get, /http.*swapi.*/).to_return(
        body: JSON.generate(body),
        status: [200, "OK"]
      )

      assert_instance_of Hash, people.find(1)
    end

    def test_people_update_should_return_a_hash_with_405_error
      body = {detail: "Method 'PUT' not allowed."}

      stub_request(:put, /http.*swapi.*/).to_return(
        body: JSON.generate(body),
        status: [405, "METHOD NOT ALLOWED"]
      )

      response = people.update
      assert_instance_of Hash, response
      assert_equal "Method 'PUT' not allowed.", response[:detail]
    end

    def test_people_create_should_return_a_hash_with_405_error
      body = {detail: "Method 'POST' not allowed."}

      stub_request(:post, /http.*swapi.*/).to_return(
        body: JSON.generate(body),
        status: [405, "METHOD NOT ALLOWED"]
      )

      response = people.create
      assert_instance_of Hash, response
      assert_equal "Method 'POST' not allowed.", response[:detail]
    end

    def test_people_delete_should_return_a_hash_with_405_error
      body = {detail: "Method 'DELETE' not allowed."}

      stub_request(:delete, /http.*swapi.*/).to_return(
        body: JSON.generate(body),
        status: [405, "METHOD NOT ALLOWED"]
      )

      response = people.delete
      assert_instance_of Hash, people.delete
      assert_equal "Method 'DELETE' not allowed.", response[:detail]
    end
  end
end
