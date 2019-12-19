module SiteMercado
  class Order
    ATTRS = %i[
      shop_id
      shop_code
      created_at
      status
      scheduled_from
      scheduled_to
      deliver
      cpf_note
      uniq_items
      market_value
      convenience_value
      delivery_value
      withdrawal_value
      change_value
      descount_value
      total_value
      recharge_value
      platform
    ].freeze

    attr_reader(*ATTRS)

    class << self
      def find_order(code)
        new(Client.get("/pedido/#{code}"))
      end

      def in_separation(code)
        Client.put("/pedido/#{code}/status/em_separacao")
      end
    end

    def initialize(params)
      ATTRS.each do |attr|
        translated = Entities::Order::DICTIONARY.key(attr)
        value = params.send(translated) if translated
        instance_variable_set("@#{attr}", value) if value
      end
    end

    def shop
      OpenStruct.new(@shop)
    end
  end
end
