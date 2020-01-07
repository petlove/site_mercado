require 'spec_helper'

RSpec.describe SiteMercado::Entities::Event do
  it_behaves_like 'entity_attributes', %i[
    id
    codigoPedido
    status
    idLoja
  ]
end
