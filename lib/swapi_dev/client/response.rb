# frozen_string_literal: true

module SwapiDev
  class Response
    def self.handle(http_response, **args)
      serializer = args[:format] == "wookiee" ? Wookie : Default

      case http_response
      when Net::HTTPSuccess
        serializer.call(http_response.body)
      when Net::HTTPClientError
        raise ClientError, "[#{http_response.code}] #{http_response.class}"
      when Net::HTTPServerError
        raise ServerError, "[#{http_response.code}] #{http_response.class}"
      end
    end
  end
end
