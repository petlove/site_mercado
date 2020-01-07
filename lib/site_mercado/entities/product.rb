# frozen_literal_string: true

module SiteMercado
  module Entities
    class Product < Base
      DICTIONARY = {
        seller_id: :idLoja,
        department: :departamento,
        category: :categoria,
        subcategory: :subCategoria,
        brand: :marca,
        measure: :unidade,
        weight: :volume,
        barcode: :codigoBarra,
        full_name: :nome,
        price: :valor,
        stock_total: :quantidadeEstoqueAtual,
        stock_minimun: :quantidadeEstoqueMinimo,
        description: :descricao,
        active: :ativo,
        sku: :plu,
        close_validy: :validadeProxima
      }.freeze

      ATTRS = %i[
        idLoja
        departamento
        categoria
        subCategoria
        marca
        unidade
        volume
        codigoBarra
        nome
        valor
        valorPromocao
        quantidadeEstoqueAtual
        quantidadeEstoqueMinimo
        descricao
        ativo
        plu
        validadeProxima
      ].freeze

      attr_reader(*ATTRS)

      def initialize(params)
        ATTRS.map do |attr|
          value = params.dig(DICTIONARY.key(attr))
          instance_variable_set("@#{attr}", value) if value
        end

        attributes
      end
    end
  end
end
