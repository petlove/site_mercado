# frozen_literal_string: true

module SiteMercado
  module Entities
    class Order < Base
      DICTIONARY = {
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
        valorConveniencia: :convenience_value,
        valorEntrega: :delivery_value,
        valorRetirada: :withdrawal_value,
        valorTroco: :change_value,
        valorDesconto: :descount_value,
        valorTotal: :total_value,
        valorCorrigido: :recharge_value,
        plataforma: :platform,
        cliente: :customer
      }.freeze

      ATTRS = %i[
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
        convenience_value
        delivery_value
        withdrawal_value
        change_value
        descount_value
        total_value
        recharge_value
        platform
        customer
      ].freeze

      attr_reader(*ATTRS)

      def initialize(params)
        super(params, ATTRS, DICTIONARY)

        @customer = SiteMercado::Entities::Customer.new(OpenStruct.new(@customer))
      end
    end
  end
end
