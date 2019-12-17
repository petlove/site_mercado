# frozen_string_literal: true

require 'faraday'
require 'json'

module SiteMercado
  class Client
    class << self
      def api_version
        ENV['API_VERSION'] || '/api/v1/'
      end

      def endpoint
        ENV['SITEMERCADO_URL'] || base_url
      end

      def base_url
        'https://service.sitemercado.com.br/'
      end

      def get(path, params = {}, auth: true)
        response = connection.get do |request|
          request.url "#{api_version}#{path}"
          request.params = params
          request.headers['Content-Type'] = 'application/json'
          request.headers['accept'] = 'application/json'
          request.headers['authorization'] = "Bearer #{token}" if auth
        end

        parser(response.body)
      end

      def post(path, body = {}, auth: true)
        response = connection.post do |request|
          request.url "#{api_version}#{path}"
          request.headers['Content-Type'] = 'application/json'
          request.headers['accept'] = 'application/json'
          request.headers['authorization'] = "Bearer #{token}" if auth
          request.body = body.to_json
        end

        parser(response.body)
      end

      private

      def token
        SiteMercado.oauth.token
      end

      def parser(json)
        parsed = JSON.parse(json)
        return OpenStruct.new(parsed) if parsed.is_a?(Hash)

        parsed.map do |parse|
          OpenStruct.new(parse)
        end
      end

      def connection
        @connection ||= Faraday.new(url: endpoint)
      end
    end
  end
end
