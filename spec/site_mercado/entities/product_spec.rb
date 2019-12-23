require 'spec_helper'

RSpec.describe SiteMercado::Entities::Product do
  it_behaves_like 'entity_attributes', %i[
    seller_id
    department
    category
    subcategory
    brand
    measure
    volume
    barcode
    full_name
    list_price
    price
    total_prime
    stock_minimun
    description
    active
    sku
    validation
  ]

  describe '#initialize' do
    let(:payload) { load_json_from('spec/support/examples/product.json') }

    subject { described_class.new(payload) }

    it 'returns the correct collection' do
      is_expected.to be_a(SiteMercado::Entities::Product)

      expect(subject.attributes).to include(
        ativo: 'true',
        categoria: 'Medicina e Saúde',
        codigoBarra: '7891106005708',
        idLoja: '123',
        marca: 'Drontal',
        nome: 'Drontal Plus Sabor Carne Cães 10 Kg - 4 Comprimidos',
        plu: '31023660-2',
        quantidadeEstoqueAtual: '44',
        quantidadeEstoqueMinimo: '0',
        subCategoria: 'Vermífugos',
        unidade: 'uni',
        valor: '40.49',
        valorPromocao: '40.49',
        volume: '0.013'
      )
    end
  end
end
