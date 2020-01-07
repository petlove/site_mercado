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
        super(params, ATTRS, DICTIONARY)

        @transactions = @transactions.map do |transaction|
          SiteMercado::Transaction.new(transaction)
        end
      end
    end
  end
end
