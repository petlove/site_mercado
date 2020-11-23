# frozen_string_literal: true

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

  describe '.initialize' do
    let(:params) do
      {
        'enderecos' => [
          {
            'id' => 43,
            'logradouro' => 'itaim',
            'numero' => 4134,
            'complemento' => '*',
            'uf' => 'SP',
            'cidade' => 'Sao Paulo',
            'estado' => 'Sao Paulo'
          }
        ]
      }
    end

    subject { described_class.new(params).addresses }

    it 'creates a address' do
      expect(subject.first).to be_a(SiteMercado::Entities::Address)
    end
  end
end
