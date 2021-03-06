# frozen_string_literal: true

module SiteMercado
  class Order
    class << self
      def find(code)
        SiteMercado::Entities::Order.new(Client.get("/pedido/#{code}"))
      end

      def find_by_encoded(code)
        decoded = SiteMercado::Helpers::OrderParser.decode_id(code)
        SiteMercado::Entities::Order.new(Client.get("/pedido/#{decoded}"))
      end

      def in_separation(code)
        Client.put("/pedido/#{code}/status/em_separacao")
      end

      def separated(code, separator:, amount_cold_bag: 0, amount_dry_bag: 0, total_value: nil)
        params = {
          nomeSeparador: separator,
          quantidadeSacolasResfriada: amount_cold_bag,
          quantidadeSacolasSeca: amount_dry_bag,
          valorTotal: total_value
        }
        Client.put("/pedido/#{code}/status/separado", body: params)
      end

      def cancel(code, message: nil)
        params = { mensagem: message }
        Client.put("/pedido/#{code}/status/cancelar", body: params)
      end
    end
  end
end
