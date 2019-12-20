require 'spec_helper'

RSpec.describe SiteMercado::Entities::Product do
  it_behaves_like 'entity_attributes', %i[
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
  ]
end
