# frozen_literal_string: true

module SiteMercado
  module Entities
    class Payment < Base
      DICTIONARY = {
        id: :id,
        nome: :name,
        valor: :value,
        tipo: :type,
        transacoes: :transactions
      }.freeze

      ATTRS = %i[
        id
        name
        value
        type
        transactions
      ].freeze

      attr_reader(*ATTRS)

      def initialize(params)
        @transactions = []
        super(params, ATTRS, DICTIONARY)

        @transactions = @transactions.map do |transaction|
          SiteMercado::Entities::Transaction.new(transaction)
        end
      end

      def offline?
        type.casecmp('offline').zero?
      end

      def online?
        type.casecmp('online').zero?
      end
    end
  end
end
