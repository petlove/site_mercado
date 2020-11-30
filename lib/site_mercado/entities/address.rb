# frozen_string_literal: true

module SiteMercado
  module Entities
    class Address < Base
      DICTIONARY = {
        id: :id,
        logradouro: :public_space,
        numero: :number,
        complemento: :complement,
        bairro: :neighborhood,
        cidade: :city,
        uf: :uf,
        estado: :state,
        cep: :zipcode
      }.freeze

      ATTRS = %i[
        id
        public_space
        number
        complement
        neighborhood
        city
        uf
        state
        zipcode
      ].freeze

      attr_reader(*ATTRS)

      def initialize(params)
        super(params, ATTRS, DICTIONARY)
      end
    end
  end
end
