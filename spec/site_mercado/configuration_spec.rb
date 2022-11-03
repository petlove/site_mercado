# frozen_string_literal: true

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

  describe '.api_version' do
    subject { configuration.api_version }

    context 'when does not has SITEMERCADO_API_VERSION' do
      let(:endpoint) { '/api/v1' }

      it 'creates with default endpoint' do
        is_expected.to eq(endpoint)
      end
    end

    context 'when does has SITEMERCADO_API_VERSION' do
      let(:api_version) { "/api/v#{Faker::Number.number(digits: 2)}" }

      before { ENV['SITEMERCADO_API_VERSION'] = api_version }

      it 'creates with default endpoint' do
        is_expected.to eq(api_version)
      end
    end
  end
end
