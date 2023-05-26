# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SiteMercado::Entities::Product do
  it_behaves_like 'entity_attributes', %i[
    seller_id
    department
    category
    subcategory
    brand
    measure
    weight
    barcode
    full_name
    price
    stock_total
    stock_minimum
    description
    active
    sku
    close_validy
    image
    promotional_price
  ]

  describe '#initialize' do
    let(:payload) { load_json_from('spec/support/examples/product.json') }

    subject { described_class.new(payload) }

    it 'returns the correct collection' do
      is_expected.to be_a(SiteMercado::Entities::Product)

      description = 'O <strong>Vermífugo Bayer Drontal Plus Sabor Carne - Cães ' \
                    '10 Kg</strong> é indicado para o tratamento e controle ' \
                    'das verminoses intestinais e de giardíase em cães, ' \
                    'apresentando excelentes resultando contra parasitas ' \
                    'cestoides (vermes chatos), nematódeos (vermes redondos) e ' \
                    'protozoários. <br><br> *Consulte sempre o medico ' \
                    'Veterinário de sua confiança para o uso apropriado deste ' \
                    'medicamento. Leia a bula ou informações descritas na ' \
                    'embalagem.'

      expect(subject.attributes).to include(
        ativo: 'true',
        categoria: 'Medicina e Saúde',
        codigoBarra: '7891106005708',
        departamento: 'Cachorro',
        descricao: description,
        idLoja: '123456',
        marca: 'Drontal',
        nome: 'Drontal Plus Sabor Carne Cães 10 Kg - 4 Comprimidos',
        plu: '00023660-2',
        quantidadeEstoqueAtual: '4141',
        quantidadeEstoqueMinimo: '0',
        subCategoria: 'Vermífugos',
        unidade: 'uni',
        validadeProxima: 'false',
        valor: '1.49',
        volume: '0.013'
      )
    end
  end
end
