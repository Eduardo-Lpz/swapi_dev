# frozen_string_literal: true

module SwapiDev
  class BaseSerializer
    def self.call(_content)
      raise NoMethodError
    end
  end
end
