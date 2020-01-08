# frozen_string_literal: true

require 'spec_helper'

FactoryBot.define do
  factory :payment, class: 'SiteMercado::Entities::Payment' do
    valor { Faker::Number.decimal(l_digits: 2) }
    tipo { %w[Online Offline].sample }

    trait :online do
      tipo { 'Online' }
    end

    trait :offline do
      tipo { 'Offline' }
    end

    initialize_with do
      new(
        'valor' => valor,
        'tipo' => tipo
      )
    end
  end
end
