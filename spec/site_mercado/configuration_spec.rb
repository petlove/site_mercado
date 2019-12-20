require 'spec_helper'

RSpec.describe SiteMercado::Configuration do
  let(:configuration) { described_class.new }

  describe '.endpoint' do
    subject { configuration.endpoint }

    context 'when does not has SITEMERCADO_URL' do
      let(:endpoint) { 'https://service.sitemercado.com.br/' }

      it 'creates with default endpoint' do
        is_expected.to eq(endpoint)
      end
    end

    context 'when does has SITEMERCADO_URL' do
      let(:endpoint) { Faker::Internet.url }

      before { ENV['SITEMERCADO_URL'] = endpoint }

      it 'creates with default endpoint' do
        is_expected.to eq(endpoint)
      end
    end
  end
end
