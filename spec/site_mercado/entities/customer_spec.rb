require 'spec_helper'

RSpec.describe SiteMercado::Entities::Customer do
  it_behaves_like 'entity_attributes', %i[
    id
    nome
    email
    cpf
    rg
    tipo
    publicidadeEmail
    publicidadeSms
    dataNascimento
    genero
    telefoneCelular
    telefoneFixo
    enderecos
  ]
end
