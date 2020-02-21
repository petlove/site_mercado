require 'spec_helper'

RSpec.describe SiteMercado::Helpers::OrderParser do
  let(:order_ids) do
    %w[
      2681-F1103705
      2681-F1107141
    ]
  end
  let(:encoded_ids) do
    %w[
      2681701103705
      2681701107141
    ]
  end

  describe '#encode_id' do
    let(:order_id) { order_ids.sample }

    subject { described_class.encode_id(order_id) }

    it 'encode to a number only format' do
      expect(encoded_ids).to include(subject)
    end
  end

  describe '#decode_id' do
    let(:encoded_id) { encoded_ids.sample }

    subject { described_class.decode_id(encoded_id) }

    it 'encode to a number only format' do
      expect(order_ids).to include(subject)
    end
  end
end
