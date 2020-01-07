module SiteMercado
  module Entities
    class Customer
      class << self
        def find(customer_id)
          SiteMercado::Entities::Customer.new(
            Client.get("/client/#{customer_id}")
          )
        end
      end
    end
  end
end
