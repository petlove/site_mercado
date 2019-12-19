
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
        plataforma: :platform
      }.freeze

      def attributes
        DICTIONARY
      end
    end
  end
end
