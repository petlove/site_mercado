# frozen_string_literal: true

# frozen_literal_string: true

module SiteMercado
  module Entities
    class Item < Base
      DICTIONARY = {
        id: :id,
        index: :index,
        codigo: :order_id,
        codigoLoja: :shop_id,
        pesoVariavel: :weight,
        codigoBarra: :ean,
        plu: :sku,
        produto: :description,
        observacao: :observation,
        quantidade: :quantity,
        quantidade3: :quantity3,
        valor: :price,
        valorTotal: :total,
        indisponivel: :available,
        desistencia: :removed
      }.freeze

      ATTRS = %i[
        id
        index
        order_id
        shop_id
        weight
        ean
        sku
        description
        observation
        quantity
        quantity3
        price
        total
        available
        removed
      ].freeze

      attr_reader(*ATTRS)

      def initialize(params)
        super(params, ATTRS, DICTIONARY)
      end
    end
  end
end
