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

      def check_event(ids)
        body = if ids.is_a?(Array)
                 ids.map { |id| { id: id } }
               elsif ids.is_a?(Integer)
                 [id: ids]
               else
                 [{}]
               end

        Client.post('/pedido/eventos/verificado', body)
      end
    end
  end
end
