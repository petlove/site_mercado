# frozen_string_literal: true

require 'spec_helper'

FactoryBot.define do
  factory :order, class: 'SiteMercado::Entities::Order' do
    status { SiteMercado::Entities::Event::STATUS.sample }
    dataHora { Faker::Date.backward(days: Faker::Number.number) }
    valorTotal { Faker::Number.decimal(l_digits: 2) }
    valorEntrega { Faker::Number.decimal(l_digits: 2) }
    valorConveniencia { Faker::Number.decimal(l_digits: 2) }
    valorDesconto { Faker::Number.decimal(l_digits: 2) }

    initialize_with do
      new(
        'status' => status,
        'dataHora' => dataHora,
        'valorTotal' => valorTotal,
        'valorEntrega' => valorEntrega,
        'valorConveniencia' => valorConveniencia,
        'valorDesconto' => valorDesconto,
        'pagamentos' => []
      )
    end

    after :build do |order|
      order.instance_variable_set(:@payments, build_list(:payment, 5))
    end
  end
end
