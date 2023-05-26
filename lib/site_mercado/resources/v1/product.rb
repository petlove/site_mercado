# frozen_string_literal: true

module SiteMercado
  class Product
    class << self
      def post(body, reset: false)
        products = [body].flatten.map do |product|
          SiteMercado::Entities::Product.new(product).attributes
        end

        reset_param = '?reset=true' if reset

        Client.post("/produtointegracao#{reset_param}", body: products)
      end
    end
  end
end
