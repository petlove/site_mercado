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

  describe '.encoded_id' do
    let(:order) { build(:order) }

    subject { order.encoded_id }

    after { subject }

    it 'calls order parser helper' do
      expect(SiteMercado::Helpers::OrderParser).to receive(:encode_id).with(order.id)
    end
  end

  describe '.total_payments' do
    let(:order) { build(:order) }
    let(:payments) { build_list(:payment, 5, valor: 10.0) }
    let(:total) { 50 }

    before { order.instance_variable_set(:@payments, payments) }

    subject { order.total_payments }

    it 'returns the total of the payment' do
      is_expected.to eq(total)
    end
  end

  describe '.offline_payments?' do
    let(:order) { build(:order) }

    before { order.instance_variable_set(:@payments, payments) }

    subject { order.offline_payments? }

    context 'when has offline payments' do
      let(:payments) { build_list(:payment, 5, :offline) }

      it 'returns true' do
        is_expected.to be_truthy
      end
    end

    context 'when has no offline payments' do
      let(:payments) { build_list(:payment, 5, :online) }

      it 'returns false' do
        is_expected.to be_falsey
      end
    end
  end

  describe '.online_payments?' do
    let(:order) { build(:order) }

    before { order.instance_variable_set(:@payments, payments) }

    subject { order.online_payments? }

    context 'when has online payments' do
      let(:payments) { build_list(:payment, 5, tipo: 'Online') }

      it 'returns true' do
        is_expected.to be_truthy
      end
    end

    context 'when has no onlinepayments' do
      let(:payments) { build_list(:payment, 5, tipo: 'Offline') }

      it 'returns false' do
        is_expected.to be_falsey
      end
    end
  end
end
