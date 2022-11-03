# frozen_string_literal: true

require 'faraday'
require 'json'
require 'oj'

module SiteMercado
  class Client
    class << self
      def request(path, params: {}, body: nil, auth: true)
        handle_request do
          connection.public_send(__callee__) do |request|
            request.url "#{api_version}#{path}"
            request.headers[:authorization] = "Bearer #{token}" if auth
            request.body = body.to_json if body
            request.params = params
          end
        end
      end

      alias get request
      alias put request
      alias post request
      alias patch request
      alias delete request

      private

      def handle_request
        response = yield
        return Oj.load(response.body) if response.success?

        handle_error(response)
      end

      def handle_error(response)
        case response.status
        when 400
          raise Errors::BadRequestError.new(response)
        when 401
          raise Errors::UnauthorizedError.new(response)
        when 412
          raise Errors::PreconditionFailedError.new(response)
        when 404
          raise Errors::ResourceNotFoundError.new(response)
        else
          raise Errors::UnknownStatusError.new(response)
        end
      end

      def connection
        @connection ||= Faraday.new(
          url: endpoint,
          headers: default_headers
        )
      end

      def default_headers
        {
          'Content-Type' => 'application/json',
          'accept' => 'application/json'
        }
      end

      def token
        SiteMercado.oauth.token
      end

      def api_version
        SiteMercado.configuration.api_version
      end

      def endpoint
        SiteMercado.configuration.endpoint
      end
    end
  end
end
