# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SiteMercado::Order do
  let(:code) { '1912132615-F7162' }

  describe '#find' do
    subject { described_class.find(code) }

    context 'when valid code' do
      it 'returns a order', :vcr do
        is_expected.to be_a(SiteMercado::Entities::Order)
      end
    end

    context 'when invalid code' do
      let(:code) { '1000000000-A0000' }

      it 'raises error', :vcr do
        expect { subject }.to(
          raise_error(SiteMercado::Errors::PreconditionFailedError)
        )
      end
    end
  end

  describe '#find_by_encoded' do
    subject { described_class.find_by_encoded(code) }

    context 'when valid encoded' do
      let(:code) { '2615701780054' }

      it 'returns a order', :vcr do
        is_expected.to be_a(SiteMercado::Entities::Order)
      end
    end

    context 'when invalid encoded' do
      let(:code) { '2615701780000' }

      it 'raises error', :vcr do
        expect { subject }.to(
          raise_error(SiteMercado::Errors::PreconditionFailedError)
        )
      end
    end
  end

  describe '#in_separation' do
    let(:code) { '2001152615-D8742' }

    subject { described_class.in_separation(code) }

    context 'when valid encoded' do
      it 'returns a order', :vcr do
        expect(SiteMercado::Client).to(
          receive(:put).with("/pedido/#{code}/status/em_separacao")
        )
        subject
      end
    end

    context 'when invalid encoded' do
      let(:code) { '1000000000-A0000' }

      it 'raises error', :vcr do
        expect { subject }.to(
          raise_error(SiteMercado::Errors::PreconditionFailedError)
        )
      end
    end
  end

  describe '#separated' do
    let(:code) { '2001152615-D8742' }
    let(:options) do
      {
        separator: Faker::FunnyName.name,
        amount_cold_bag: 4,
        amount_dry_bag: 7,
        total_value: 78.4
      }
    end
    let(:body) do
      {
        nomeSeparador: options[:separator],
        quantidadeSacolasSeca: options[:amount_dry_bag],
        quantidadeSacolasResfriada: options[:amount_cold_bag],
        valorTotal: options[:total_value]
      }
    end

    subject { described_class.separated(code, **options) }

    context 'when valid encoded' do
      it 'returns a order', :vcr do
        expect(SiteMercado::Client).to(
          receive(:put)
            .with("/pedido/#{code}/status/separado", body:)
        )
        subject
      end
    end

    context 'when invalid encoded' do
      let(:code) { '1000000000-A0000' }

      it 'raises error', :vcr do
        expect { subject }.to(
          raise_error(SiteMercado::Errors::PreconditionFailedError)
        )
      end
    end
  end

  describe '#cancel' do
    let(:code) { '2001152615-D8742' }
    let(:options) { { message: Faker::Movie.quote } }
    let(:body) { { mensagem: options[:message] } }

    subject { described_class.cancel(code, **options) }

    context 'when valid encoded' do
      it 'returns a order', :vcr do
        expect(SiteMercado::Client).to(
          receive(:put)
            .with("/pedido/#{code}/status/cancelar", body:)
        )
        subject
      end
    end

    context 'when invalid encoded' do
      let(:code) { '1000000000-A0000' }

      it 'raises error', :vcr do
        expect { subject }.to(
          raise_error(SiteMercado::Errors::PreconditionFailedError)
        )
      end
    end
  end
end
