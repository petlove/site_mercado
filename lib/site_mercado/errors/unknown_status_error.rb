# frozen_string_literal: true

require 'oj'

module SiteMercado
  module Errors
    class UnknownStatusError < StandardError
      attr_reader :status, :body

      def self.build_message(body)
        prefix = '[ERROR] Precondition Failed!'
        message = body.delete('message')
        metadata = body.to_s
        "#{prefix} API Message: '#{message}' metadata: #{metadata}"
      end

      def initialize(response = nil)
        @status = response.nil? ? 418 : response.status

        super("[ERROR] Unknown Status! Status: #{response.status} Body response: '#{response.body}'")
      end
    end
  end
end
