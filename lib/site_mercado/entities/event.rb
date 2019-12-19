module SiteMercado
  module Entities
    class Event < Base
      DICTIONARY = {
        id: :id,
        codigoPedido: :order_id,
        status: :status,
        idLoja: :shop_id
      }.freeze

      ATTRS = %i[
        id
        order_id
        status
        shop_id
      ]

      attr_reader(*ATTRS)

      def initialize(params)
        ATTRS.each do |attr|
          translated = DICTIONARY.key(attr)
          value = params.send(translated) if translated
          instance_variable_set("@#{attr}", value) if value
        end
      end
    end
  end
end
