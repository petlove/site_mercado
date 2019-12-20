# frozen_literal_string: true

module SiteMercado
  module Entities
    class Order < Base
      DICTIONARY = {
        codigo: :id,
        idLoja: :shop_id,
        codigoLoja: :shop_code,
        dataHora: :created_at,
        status: :status,
        agendamentoDataInicio: :scheduled_from,
        agendamentoDataFim: :scheduled_to,
        deliver: :deliver,
        cpfNaNota: :cpf_note,
        quantidadeItemUnico: :uniq_items,
        valorMercado: :market_value,
        valorConveniencia: :interest_cost,
        valorEntrega: :shipping_cost,
        valorRetirada: :withdrawal_cost,
        valorTroco: :change,
        valorDesconto: :discount,
        valorTotal: :total_value,
        valorCorrigido: :recharge_value,
        plataforma: :platform,
        cliente: :customer,
        enderecoEntrega: :ship_address,
        pagamentos: :payments,
        items: :items
      }.freeze

      ATTRS = %i[
        id
        shop_id
        shop_code
        created_at
        status
        scheduled_from
        scheduled_to
        deliver
        cpf_note
        uniq_items
        market_value
        interest_cost
        shipping_cost
        withdrawal_cost
        change
        discount
        total_value
        recharge_value
        platform
        customer
        ship_address
        payments
        items
      ].freeze

      attr_reader(*ATTRS)

      def initialize(params)
        super(params, ATTRS, DICTIONARY)

        @customer = SiteMercado::Entities::Customer.new(OpenStruct.new(@customer))
        @payments = @payments.map do |payment|
          SiteMercado::Entities::Payment.new(OpenStruct.new(payment))
        end
        @items = @items.map do |item|
          SiteMercado::Entities::Item.new(OpenStruct.new(item))
        end
      end
    end
  end
end
