# frozen_string_literal: true

require 'spec_helper'

FactoryBot.define do
  factory :transaction, class: 'SiteMercado::Entities::Transaction' do
    valor { Faker::Number.decimal(l_digits: 2) }

    initialize_with { new(attributes) }
  end
end
