# frozen_string_literal: true

module SwapiDev
  class Client
    def initialize(base_url)
      @uri_builder = UriBuilder.new(base_url)
    end

    def get(resource, **args)
      request(resource, **args) { :get }
    end

    def post(resource, **_args)
      request(resource) { :post }
    end

    def put(resource, **args)
      request(resource, **args) { :put }
    end

    def delete(resource, **args)
      request(resource, **args) { :delete }
    end

    private

    attr_reader :uri_builder

    def request(resource, **args)
      uri = uri_builder.build(resource, **args)
      http_response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) { |http| http.send(yield, uri) }
      Response.handle(http_response, **args)
    end
  end
end
