# frozen_string_literal: true

module SwapiDev
  class UriBuilder
    def initialize(base_url)
      @base_url = base_url
    end

    def build(resource, **options)
      uri = URI.join(@base_url, resource)
      uri.query = URI.encode_www_form(options.slice(:search, :page, :format))
      yield if block_given?
      uri
    end
  end
end
