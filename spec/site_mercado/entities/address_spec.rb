# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SiteMercado::Entities::Address do
  it_behaves_like 'entity_attributes', %i[
    id
    logradouro
    numero
    complemento
    bairro
    cidade
    uf
    estado
    cep
  ]
end
