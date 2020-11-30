# frozen_string_literal: true

module SiteMercado
  module Entities
    class Transaction < Base
      DICTIONARY = {
        bandeira: :flag,
        inicioCartao: :first_digits,
        fimCartao: :last_digits,
        adquirente: :owner,
        transactionCode1: :code1,
        transactionCode2: :code2,
        valor: :value,
        dataHora: :date_time
      }.freeze

      ATTRS = %i[
        flag
        first_digits
        last_digits
        owner
        code1
        code2
        value
        date_time
      ].freeze

      def initialize(params)
        super(params, ATTRS, DICTIONARY)
      end
    end
  end
end
