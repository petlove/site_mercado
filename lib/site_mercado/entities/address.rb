# frozen_literal_string: true

module SiteMercado
  module Entities
    class Address < Base
      DICTIONARY = {
        id: :id,
        logradouro: :public_space,
        numero: :number,
        complemento: :complement,
        bairro: :neigborhood,
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
        neigborhood
        city
        uf
        state
        zipcode
      ].freeze

      attr_reader(*ATTRS)

      def initialize(params)
        super(params)

        @addresses = @addresses.map do |address|
          SiteMercado::Entities::Address.new(
            OpenStruct.new(address)
          )
        end
      end
    end
  end
end
