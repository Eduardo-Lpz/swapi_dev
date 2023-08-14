# frozen_string_literal: true

module SwapiDev
  class Response
    def self.handle(http_response)
      if [Net::HTTPSuccess, Net::HTTPOK].member? http_response.class
        JsonSerializer.call(http_response.body)
      else
        ErrorSerializer.call(http_response)
      end
    end
  end
end
