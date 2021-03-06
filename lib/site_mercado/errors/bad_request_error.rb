# frozen_string_literal: true

require 'oj'

module SiteMercado
  module Errors
    class BadRequestError < StandardError
      attr_reader :status, :body

      def initialize(response = nil)
        @status = response.nil? ? 418 : response.status
        @body = response.nil? ? {} : Oj.load(response.body)

        super('[ERROR] Unauthorized! Check your client_id and client_secret.')
      end
    end
  end
end
