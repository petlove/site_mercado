module SiteMercado
  module Entities
    class Event < Base
      DICTIONARY = {
        id: :id,
        codigoPedido: :order_id,
        status: :state,
        idLoja: :shop_id
      }.freeze

      ATTRS = %i[
        id
        order_id
        state
        shop_id
      ].freeze

      STATUS = %w[
        EMI
        SEP
        RET
        CAN
      ].freeze

      attr_reader(*ATTRS)

      def initialize(params)
        super(params, ATTRS, DICTIONARY)
      end

      def invoiced?
        state == 'EMI'
      end

      def in_separation?
        state == 'SEP'
      end

      def separeted?
        state == 'RET'
      end

      def canceled?
        state == 'CAN'
      end
    end
  end
end
