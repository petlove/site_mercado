require 'spec_helper'

RSpec.describe SiteMercado::Client do
  describe '#request' do
    let(:path) { '/pedido/eventos' }

    context 'when fails', :vcr do
      context 'with wrong client_id' do
        before { SiteMercado.configuration.client_id = '123' }

        subject { -> { described_class.get(path) } }

        it 'raise an error' do
          is_expected.to raise_error(SiteMercado::Errors::BadRequestError)
        end
      end

      context 'with wrong client_secret' do
        before { SiteMercado.configuration.client_secret = '123' }

        subject { -> { described_class.get(path) } }

        it 'raise an error' do
          is_expected.to raise_error(SiteMercado::Errors::UnauthorizedError)
        end
      end

      context 'with wrong state transition' do
        let(:path) { '/pedido/1912232615-B5259/status/em_separacao' }

        subject { -> { described_class.put(path) } }

        it 'raise an error' do
          is_expected.to raise_error(SiteMercado::Errors::PreconditionFailedError)
        end
      end
    end

    context 'when succeeds', :vcr do
      subject { described_class.get(path) }

      it 'returns parsed body' do
        is_expected.to be_a(Array)
      end
    end

    context 'when calls get', :vcr do
      subject { described_class.get(path) }

      it 'returns parsed body' do
        is_expected.to_not be_empty
      end
    end

    context 'when calls put', :vcr do
      let(:path) { '/pedido/2001062615-B7104/status/em_separacao' }

      subject { -> { described_class.put(path) } }

      it 'not raises error' do
        is_expected.to_not raise_error
      end
    end

    context 'when calls post', :vcr do
      let(:path) { '/pedido/eventos/verificado' }
      let(:body) { [{ id: '11774415' }] }

      subject { -> { described_class.post(path, body: body) } }

      it 'not raises error' do
        is_expected.to_not raise_error
      end
    end
  end
end
