# frozen_literal_string: true

module SiteMercado
  class Product
    class << self
      def post(body)
        Client.post(
          '/produtointegracao',
          SiteMercado::Entities::Product.new(body)
        )
      end
    end
  end
end
