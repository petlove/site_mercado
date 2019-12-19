require 'spec_helper'

RSpec.describe SiteMercado::Event do
  describe '#all' do
    it 'returns a request' do
      expect(
        SiteMercado::Client
      ).to receive(:get).once.with('/pedido/eventos').and_return([])

      expect(described_class.all).to eql([])
    end
  end

  describe '#find_by_shop_id' do
    it 'returns a request' do
      expect(
        SiteMercado::Client
      ).to receive(:get).once.with('/pedido/eventos/123').and_return([])

      expect(described_class.find_by_shop_id(123)).to eql([])
    end
  end

  describe '#check_event' do
  end
end
