require 'spec_helper'

RSpec.describe SiteMercado::Oauth do
  let(:oauth) { described_class.new }
  let(:configuration) { SiteMercado::Configuration.new }
  let(:client_id) { Faker::Crypto.sha1 }
  let(:client_secret) { Faker::Crypto.sha1 }

  before do
    allow(SiteMercado).to receive(:configuration).and_return(configuration)
    SiteMercado.config do |config|
      config.client_id = client_id
      config.client_secret = client_secret
    end
  end

  describe '.client_id' do
    subject { oauth.client_id }

    it 'returns client_id from configuration' do
      is_expected.to eq(client_id)
    end
  end

  describe '.client_secret' do
    subject { oauth.client_secret }

    it 'returns client_id from configuration' do
      is_expected.to eq(client_secret)
    end
  end

  describe '.token' do
    let(:response) do
      {
        'access_token' => Faker::Crypto.sha1,
        'expires_in' => '500',
        'token_typeA' => 'Bearer'
      }
    end

    before do
      allow(Client).to receive(:post).and_return
    end

    subject { oauth.token }

    context 'when first request' do
      before do
        allow(oauth).to receive(:access_token).and_return(nil)
      end

      subject { -> { oauth.token } }

      it 'calls get_token' do
      end
    end

    context 'when expired' do
      before do
        allow(oauth).to receive(:expired?).and_return(true)
      end
    end

    context 'when not expired' do
    end
  end

  describe '.expired?' do
    subject { oauth.expired? }

    context 'when expired' do
      before do
        allow(oauth).to receive(:expires_in).and_return(Time.now - 100)
      end

      it 'returns true' do
        is_expected.to be_truthy
      end
    end

    context 'when not expired' do
      before do
        allow(oauth).to receive(:expires_in).and_return(Time.now + 100)
      end

      it 'returns false' do
        is_expected.to be_falsey
      end
    end
  end
end
