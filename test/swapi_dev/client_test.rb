# frozen_string_literal: true

require "test_helper"
require "net/http"

module SwapiDev
  class ClientTest < Minitest::Test
    def client
      Client.new("https://swapi.dev/api/")
    end

    def test_client_class_must_exist
      refute_nil Client.new("https://example.com")
    end

    def test_client_get_need_resource_argument
      assert_raises ArgumentError do
        client.get
      end
    end

    def test_client_delete_need_resource_argument
      assert_raises ArgumentError do
        client.delete
      end
    end

    def test_client_put_need_resource_argument
      assert_raises ArgumentError do
        client.put
      end
    end

    def test_client_post_need_resource_argument
      assert_raises ArgumentError do
        client.post
      end
    end
  end
end
