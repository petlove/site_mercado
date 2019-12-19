module SiteMercado
  class Event < Base
    def initialize(params)
      @id = params.id
      @order_id = params.codigoPedido
      @status = params.status
      @shop_id = params.idLoja
    end
  end
end
