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
        PE0
        FIN
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

      def awaiting_delivery?
        state == 'ENT'
      end

      def awaiting_withdrawal?
        state == 'RET'
      end

      def awaiting_export?
        state == 'PE0'
      end

      def exported?
        state == 'PE1'
      end

      def canceled?
        state == 'CAN'
      end

      def finished?
        state == 'FIN'
      end
    end
  end
end
