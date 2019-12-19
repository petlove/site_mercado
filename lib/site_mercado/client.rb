# frozen_string_literal: true

require 'faraday'
require 'json'

module SiteMercado
  class StatusUnknownError < StandardError; end
  class UnauthorizedError < StandardError; end
  class PreconditionFailedError < StandardError; end

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
        rescues do
          response = connection.get do |request|
            request.url "#{api_version}#{path}"
            request.params = params
            request.headers.merge!('authorization': "Bearer #{token}") if auth
          end
          status = response.status

          parser_status(status)
          parser(response.body, status)
        end
      end

      def post(path, body = {}, auth: true)
        rescues do
          response = connection.post do |request|
            request.url "#{api_version}#{path}"
            request.headers[:authorization] = "Bearer #{token}" if auth
            request.body = body.to_json
          end

          status = parser_status(response.status)
          parser(response.body, status)
        end
      end

      def put(path, body = {}, auth: true)
        rescues do
          response = connection.put do |request|
            request.url "#{api_version}#{path}"
            request.headers[:authorization] = "Bearer #{token}" if auth
            request.body = body.to_json
          end

          status = parser_status(response.status)
          parser(response.body, status)
        end
      end

      private

      def parser_status(status)
        case status
        when 200, 201, 202
          :ok
        when 204
          :no_content
        when 401
          raise UnauthorizedError, 'Unauthorized'
        when 412
          raise PreconditionFailedError, 'Invalid State'
        else
          raise StatusUnknownError, 'Status unknown'
        end
      end

      def rescues(&block)
        instance_exec(&block)
      rescue JSON::ParserError
        OpenStruct.new(status: 'parser_error')
      rescue StatusUnknownError
        OpenStruct.new(error: 'status_unknown')
      rescue UnauthorizedError
        OpenStruct.new(error: 'unauthorized')
      rescue PreconditionFailedError
        OpenStruct.new(error: 'precondition_failed')
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

      def parser(json, status)
        return { status: :no_content } if no_content?(json, status)

        parsed = JSON.parse(json)
        if parsed.is_a?(Hash)
          parsed.merge(status: status)
          return OpenStruct.new(parsed)
        end

        parsed.map { |parse| OpenStruct.new(parse) }
      end

      def no_content?(json, status)
        json.empty? && status == :no_content
      end

      def connection
        @connection ||= Faraday.new(
          url: endpoint,
          headers: default_headers
        )
      end
    end
  end
end
