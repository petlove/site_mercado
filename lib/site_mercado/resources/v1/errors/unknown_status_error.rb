# frozen_string_literal: true

require 'oj'

module SiteMercado
  class UnknownStatusError < StandardError
    attr_reader :status, :body, :code, :description, :error, :id

    def self.build_message(body)
      prefix = '[ERROR] Precondition Failed!'
      message = body.delete('message')
      metadata = body.to_s
      "#{prefix} API Message: '#{message}' metadata: #{metadata}"
    end

    def initialize(response)
      @status = response.status
      @body = Oj.load(response.body) || ''

      super("[ERROR] Unknown Status! Body response: '#{body}'")
    end
  end
end
