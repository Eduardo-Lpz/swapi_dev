# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "swapi_dev"
require "minitest/autorun"
require "webmock/minitest"

WebMock.disable_net_connect!(net_http_connect_on_start: true)
