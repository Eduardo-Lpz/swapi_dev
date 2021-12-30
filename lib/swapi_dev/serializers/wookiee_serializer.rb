# frozen_string_literal: true

require "json"

module SwapiDev
  class WookieeSerializer < BaseSerializer
    def self.call(content)
      # this encoding is identical to JSON except with wookiee translations.
      # for some reason json does not work
      # TODO Wookie transalation
      JSON.parse(content, symbolize_names: true)
    rescue JSON::ParserError
      nil
    end
  end
end
