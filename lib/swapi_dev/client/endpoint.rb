# frozen_string_literal: true

module SwapiDev
  class Endpoint
    def initialize
      @client = Client.new("https://swapi.dev/api/")
    end

    def all(**args)
      client.get("#{resource}/", **args)
    end

    def find_id(id, **args)
      client.get("#{resource}/#{id}/", **args)
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
