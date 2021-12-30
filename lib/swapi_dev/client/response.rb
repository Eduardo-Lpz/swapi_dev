# frozen_string_literal: true

module SwapiDev
  class Response
    def self.handle(http_response, **args)
      serializer = args[:format] == "wookiee" ? WookieeSerializer : JsonSerializer

      case http_response
      when Net::HTTPSuccess
        serializer.call(http_response.body)
      when Net::HTTPOK
        serializer.call(http_response.body)
      else
        ErrorSerializer.call(http_response)
      end
    end
  end
end
