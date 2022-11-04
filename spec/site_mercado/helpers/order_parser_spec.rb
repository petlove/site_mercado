# frozen_string_literal: true

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

    context 'when it is a real number' do
      let(:order_id) { '29941-F69973097' }

      it 'returns an encoded number' do
        is_expected.to eql('299417069973097')
      end
    end

    context 'when it is another real number' do
      let(:order_id) { '31498-E69956712' }

      it 'returns an encoded number' do
        is_expected.to eql('314986969956712')
      end
    end
  end

  describe '#decode_id' do
    let(:encoded_id) { encoded_ids.sample }

    subject { described_class.decode_id(encoded_id) }

    it 'encode to a number only format' do
      expect(order_ids).to include(subject)
    end

    context 'when it is a real number' do
      let(:encoded_id) { '299417069973097' }

      it 'returns an decoded number' do
        is_expected.to eql('29941-F69973097')
      end
    end

    context 'when it is another real number' do
      let(:encoded_id) { '314986969956712' }

      it 'returns an decoded number' do
        is_expected.to eql('31498-E69956712')
      end
    end
  end
end
