module SiteMercado
  class Configuration
    attr_accessor :client_id, :client_secret, :endpint

    def initializer
      @endpoint = Client.endpoint
    end
  end
end
