# frozen_string_literal: true

module SwapiDev
  class Endpoint
    def initialize
      @client = Client.new("https://swapi.dev/api/")
    end

    def all
      response = client.get(resource)
      return response if response[:next].nil?

      range = (2..(response[:count] / 10.0).ceil)
      response[:results] + AsyncStream.new(range).sum { |page| list(page) }
    end

    def list(page = nil)
      client.get(resource, page: page)[:results]
    end

    def find(id)
      client.get("#{resource}/#{id}")
    end

    def search(field)
      client.get(resource, search: field.to_s)
    end

    def update(**data)
      client.put(resource, **data)
    end

    def create(**data)
      client.post(resource, **data)
    end

    def delete(**data)
      client.delete(resource, **data)
    end

    private

    attr_reader :client

    def resource
      @resource ||= self.class.name.split("::").last.downcase
      @resource << "s" unless @resource == "people"

      @resource
    end
  end
end
