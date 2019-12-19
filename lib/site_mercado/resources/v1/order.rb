module SiteMercado
  class Order
    class << self
      def find(code)
        SiteMercado::Entities::Order.new(Client.get("/pedido/#{code}"))
      end

      def in_separation(code)
        Client.put("/pedido/#{code}/status/em_separacao")
      end
    end
  end
end
