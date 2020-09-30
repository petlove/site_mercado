# frozen_string_literal: true

require 'spec_helper'

FactoryBot.define do
  factory :event, class: 'SiteMercado::Entities::Event' do
    id { Faker::Number.number(digits: 5) }
    codigoPedido { Faker::Alphanumeric.alpha(number: 7) }
    status { SiteMercado::Entities::Event::STATUS.sample }
    idLoja { Faker::Number.number(digits: 5) }

    initialize_with do
      new(
        'id' => id,
        'codigoPedido' => codigoPedido,
        'status' => status,
        'idLoja' => idLoja
      )
    end

    trait :invoiced do
      status { 'EMI' }
    end

    trait :in_separation do
      status { 'SEP' }
    end

    trait :awaiting_delivery do
      status { 'ENT' }
    end

    trait :awaiting_withdrawal do
      status { 'RET' }
    end

    trait :awaiting_export do
      status { 'PE0' }
    end

    trait :exported do
      status { 'PE1' }
    end

    trait :canceled do
      status { 'CAN' }
    end

    trait :canceled do
      status { 'FIN' }
    end
  end

  factory :event_response, class: 'OpenStruct' do
    id { Faker::Number.number(digits: 5) }
    codigoPedido { Faker::Alphanumeric.alpha(number: 7) }
    status { SiteMercado::Entities::Event::STATUS.sample }
    idLoja { Faker::Number.number(digits: 5) }
  end
end
