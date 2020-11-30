# frozen_string_literal: true

module SiteMercado
  class Event
    attr_reader :id, :order_id, :status, :shop_id

    class << self
      def all
        Client.get('/pedido/eventos').map do |event|
          SiteMercado::Entities::Event.new(event)
        end
      end

      def find_by_shop_id(shop_id)
        Client.get("/pedido/eventos/#{shop_id}").map do |event|
          SiteMercado::Entities::Event.new(event)
        end
      end

      def check(ids)
        body = case ids
               when Array
                 ids.map { |id| { id: id } }
               when Integer, String
                 [id: ids]
               else
                 [{}]
               end
        Client.post('/pedido/eventos/verificado', body: body)
      end
    end
  end
end
