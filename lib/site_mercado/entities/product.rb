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
        volume: :volume,
        barcode: :codigoBarra,
        full_name: :nome,
        list_price: :valor,
        price: :valorPromocao,
        total_prime: :quantidadeEstoqueAtual,
        stock_minimun: :quantidadeEstoqueMinimo,
        description: :descricao,
        active: :ativo,
        sku: :plu,
        validadeProxima: :validation
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
        validation
      ].freeze

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
