require 'spec_helper'

RSpec.describe SiteMercado::Product do
  let(:payload) { OpenStruct.new(load_json_from('spec/support/examples/product.json')) }

  describe '#post', vcr: true do
    subject { described_class.post(payload) }

    it 'returns success when payload is valid' do
      expect(subject.error).to eql('unauthorized')
    end
  end
end
