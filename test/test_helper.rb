# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
if ENV.fetch("COVERAGE", false)
  require "simplecov"

  SimpleCov.start do
    filters.clear
    track_files "lib/**/*.rb"

    add_filter "test/"
    add_group "Client", "lib/swapi_dev/client"
    add_group "Serializers", "lib/swapi_dev/serializers"
    add_group "Resources", "lib/swapi_dev/resources"
  end
end
require "swapi_dev"
require "minitest/autorun"
require "webmock/minitest"

WebMock.disable_net_connect!(net_http_connect_on_start: true)
