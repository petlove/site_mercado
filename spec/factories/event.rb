# frozen_string_literal: true

require 'spec_helper'

FactoryBot.define do
  factory :event, class: 'OpenStruct' do
    trait :response do
      id { Faker::Number.number(digits: 5) }
      codigoPedido { Faker::Alphanumeric.alpha(number: 7) }
      status { SiteMercado::Entities::Event::STATUS.sample }
      idLoja { Faker::Number.number(digits: 5) }
    end

    initialize_with { new(attributes) }
  end
end
