# frozen_string_literal: true

require 'spec_helper'
require 'oj'

RSpec.describe SiteMercado::Errors::UnknownStatusError do
  describe '#build_message' do
    let(:body) do
      {
        'message' => 'error message',
        'data1' => '5324',
        'data2' => '1234'
      }
    end
    let(:metadata) do
      {
        'data1' => '5324',
        'data2' => '1234'
      }
    end

    let(:message) do
      "[ERROR] Precondition Failed! API Message: 'error message' metadata: #{metadata}"
    end

    subject { described_class.build_message(body) }

    it 'returs a formatted message' do
      is_expected.to eq(message)
    end
  end

  describe '.initialize' do
    subject { described_class.new(response) }

    context 'when response is given' do
      let(:body) { { foo: 'bar' }.to_s }
      let(:response) { double(status: 422, body: body) }

      it 'exception has status attributes' do
        expect(subject.status).to eq(422)
      end
    end

    context 'when response is nil' do
      let(:response) { nil }
    end
  end
end
