# frozen_string_literal: true

require "json"

module SwapiDev
  class ErrorSerializer < BaseSerializer
    def self.call(content)
      JSON.parse(content.body, symbolize_names: true).merge(
        {
          message: content.message,
          code: content.code
        }
      )
    rescue
      nil
    end
  end
end
