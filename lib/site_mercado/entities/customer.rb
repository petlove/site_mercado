# frozen_literal_string: true

module SiteMercado
  module Entities
    class Customer < Base
      DICTIONARY = {
        id: :id,
        nome: :name,
        email: :email,
        cpf: :cpf,
        rg: :rg,
        tipo: :type,
        publicidadeEmail: :public_email,
        publicidadeSms: :public_sms,
        dataNascimento: :birthday,
        genero: :gender,
        telefoneCelular: :phone_number,
        telefoneFixo: :home_number,
        enderecos: :addresses
      }.freeze

      ATTRS = %i[
        id
        name
        email
        cpf
        rg
        type
        public_email
        public_sms
        birthday
        gender
        phone_number
        home_number
        addresses
      ].freeze

      def initialize(params)
        super(params, ATTRS, DICTIONARY)

        @addresses = @addresses.map do |address|
          SiteMercado::Entities::Address.new(OpenStruct.new(address))
        end
      end
    end
  end
end
