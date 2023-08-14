# frozen_string_literal: true

require "net/http"

module SwapiDev
  class Client
    def initialize(base_url)
      @uri_builder = UriBuilder.new(base_url)
    end

    def get(resource, **args)
      request(resource, **args) { Net::HTTP::Get.new(_1) }
    end

    private

    attr_reader :uri_builder

    def request(resource, **args)
      uri = uri_builder.build(resource, **args)
      http_response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        request = yield(uri)
        http.request(request)
      end
      Response.handle(http_response)
    end
  end
end
