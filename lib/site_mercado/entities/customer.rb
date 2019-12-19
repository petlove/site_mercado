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
        enderecos: :address
      }.freeze
    end
  end
end
