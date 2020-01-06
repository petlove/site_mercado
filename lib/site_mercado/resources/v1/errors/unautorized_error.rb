# frozen_string_literal: true

require 'oj'

module SiteMercado
  class UnauthorizedError < StandardError
    attr_reader :status, :body

    def initialize(response)
      @status = response.status
      @body = Oj.load(response.body) || ''

      super('[ERROR] Unauthorized! Check your client_id and client_secret.')
    end
  end
end
