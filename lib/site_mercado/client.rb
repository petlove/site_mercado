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

      def errors_map
        {
          400 => Errors::BadRequestError,
          401 => Errors::UnauthorizedError,
          412 => Errors::PreconditionFailedError,
          404 => Errors::ResourceNotFoundError
        }
      end

      def handle_error(response)
        raise (errors_map[response.status] || Errors::UnknownStatusError).new(response)
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
