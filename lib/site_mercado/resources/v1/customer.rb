module SiteMercado
  class Customer
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
