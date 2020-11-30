# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SiteMercado::Entities::Payment do
  it_behaves_like 'entity_attributes', %i[
    id
    nome
    valor
    tipo
    transacoes
  ]

  describe '.initialize' do
    context 'creates transactions' do
      let(:params) do
        {
          'transacoes' => [
            {
              'bandeira' => 'Mastercard',
              'valor' => 32.50
            }
          ]
        }
      end
      let(:payment) { described_class.new(params) }

      subject { payment.transactions }

      it 'expects to have transactions' do
        expect(subject.first).to be_a(SiteMercado::Entities::Transaction)
      end
    end
  end

  describe '.offline?' do
    subject { payment.offline? }

    context 'when offline' do
      let(:payment) { build(:payment, :offline) }

      it 'returns true' do
        is_expected.to be true
      end
    end
    context 'when online' do
      let(:payment) { build(:payment, :online) }

      it 'returns false' do
        is_expected.to be false
      end
    end
  end

  describe '.online?' do
    subject { payment.online? }

    context 'when offline' do
      let(:payment) { build(:payment, :offline) }

      it 'returns false' do
        is_expected.to be false
      end
    end
    context 'when online' do
      let(:payment) { build(:payment, :online) }

      it 'returns true' do
        is_expected.to be true
      end
    end
  end
end
