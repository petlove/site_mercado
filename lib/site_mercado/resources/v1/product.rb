# frozen_string_literal: true

module SiteMercado
  class Product
    class << self
      def post(body, reset: false)
        products = [body].flatten.map do |product|
          SiteMercado::Entities::Product.new(product).attributes
        end

        Client.post("/produtointegracao#{reset ? '?reset=true' : ''}", body: products)
      end
    end
  end
end
