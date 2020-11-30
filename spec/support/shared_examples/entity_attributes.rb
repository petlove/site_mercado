# frozen_string_literal: true

shared_examples 'entity_attributes' do |attrs|
  it 'expect to cover all dictionary attributes' do
    expect(described_class::DICTIONARY.keys).to match_array(attrs)
  end
end
