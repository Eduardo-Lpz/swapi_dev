# frozen_string_literal: true

require "json"

module SwapiDev
  class Default < Serializer
    def self.call(content)
      JSON.parse(content, symbolize_names: true)
    rescue JSON::ParserError
      nil
    end
  end
end
