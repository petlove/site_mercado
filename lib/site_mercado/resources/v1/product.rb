# frozen_literal_string: true

module SiteMercado
  class Product
    class << self
      def post(body)
        products = [body].flatten.map do |product|
          SiteMercado::Entities::Product.new(product).attributes
        end

        Client.post('/produtointegracao', body: products)
      end
    end
  end
end
