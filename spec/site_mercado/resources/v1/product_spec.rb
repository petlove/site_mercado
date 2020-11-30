# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SiteMercado::Product do
  let(:payload) { load_json_from('spec/support/examples/product.json') }

  describe '#post', vcr: true do
    subject { described_class.post(payload) }

    it 'returns success when payload is valid' do
      expect(
        SiteMercado::Client
      ).to receive(:post).once.with('/produtointegracao', body: anything)

      subject
    end
  end
end
