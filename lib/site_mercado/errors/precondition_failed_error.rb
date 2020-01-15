# frozen_string_literal: true

require 'oj'

module SiteMercado
  module Errors
    class PreconditionFailedError < StandardError
      attr_reader :status, :body, :code, :description, :error, :id

      def self.build_message(body)
        prefix = '[ERROR] Precondition Failed!'
        message = body.delete('message')
        metadata = body.to_s
        "#{prefix} API Message: '#{message}' metadata: #{metadata}"
      end

      def initialize(response = nil)
        @status = response.nil? ? 418 : response.status
        @body = response.nil? ? {} : Oj.load(response.body)
        @code = body['codigo']
        @descricao = body['descricao']
        @id = body['id']

        super(self.class.build_message(body))
      end
    end
  end
end
