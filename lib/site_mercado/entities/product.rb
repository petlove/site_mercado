# frozen_literal_string: true

module SiteMercado
  module Entities
    class Product < Base
      DICTIONARY = {
        idLoja: :seller_id,
        departamento: :department,
        categoria: :category,
        subCategoria: :subcategory,
        marca: :brand,
        unidade: :measure,
        volume: :volume,
        codigoBarra: :barcode,
        nome: :full_name,
        valor: :list_price,
        valorPromocao: :price,
        quantidadeEstoqueAtual: :total_prime,
        quantidadeEstoqueMinimo: :stock_minimun,
        descricao: :description,
        ativo: :active,
        plu: :sku,
        validadeProxima: :validation
      }.freeze

      ATTRS = %i[
        seller_id
        department
        category
        subcategory
        brand
        measure
        volume
        barcode
        full_name
        list_price
        price
        total_prime
        stock_minimun
        description
        active
        sku
        validation
      ].freeze

      attr_reader(*ATTRS)

      def initialize(params)
        super(params, ATTRS, DICTIONARY)

        @products = @products.map do |address|
          SiteMercado::Entities::Product.new(OpenStruct.new(address))
        end
      end
    end
  end
end
