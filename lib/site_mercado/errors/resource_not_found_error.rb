# frozen_string_literal: true

require 'oj'

module SiteMercado
  module Errors
    class ResourceNotFoundError < StandardError
      attr_reader :status, :body

      def initialize(response = nil)
        @status = response.nil? ? 404 : response.status

        super('[ERROR] Resource not found!') 
      end
    end
  end
end
