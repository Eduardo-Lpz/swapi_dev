# frozen_string_literal: true

require "net/http"

module SwapiDev
  class Client
    def initialize(base_url)
      @uri_builder = UriBuilder.new(base_url)
    end

    def get(resource, **args)
      request(resource, **args) { |uri| Net::HTTP::Get.new(uri) }
    end

    def post(resource, **args)
      request(resource, **args) { |uri| Net::HTTP::Post.new(uri) }
    end

    def put(resource, **args)
      request(resource, **args) { |uri| Net::HTTP::Put.new(uri) }
    end

    def delete(resource, **args)
      request(resource, **args) { |uri| Net::HTTP::Delete.new(uri) }
    end

    private

    attr_reader :uri_builder

    def request(resource, **args)
      uri = uri_builder.build(resource, **args)
      http_response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        request = yield(uri)
        request["Content-Type"] = "application/json" if request.instance_of?(Net::HTTP::Put) || request.instance_of?(Net::HTTP::Post)
        http.request(request)
      end
      Response.handle(http_response, **args)
    end
  end
end
