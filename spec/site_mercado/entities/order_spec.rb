require 'spec_helper'

RSpec.describe SiteMercado::Entities::Order do
  it_behaves_like 'entity_attributes', %i[
    codigo
    idLoja
    codigoLoja
    dataHora
    status
    agendamentoDataInicio
    agendamentoDataFim
    deliver
    cpfNaNota
    quantidadeItemUnico
    valorMercado
    valorConveniencia
    valorEntrega
    valorRetirada
    valorTroco
    valorDesconto
    valorTotal
    valorCorrigido
    plataforma
    cliente
    enderecoEntrega
    pagamentos
    items
  ]
end