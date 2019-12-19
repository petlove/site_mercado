# frozen_string_literal: true

module SiteMercado
  class Configuration
    attr_accessor :client_id, :client_secret, :endpoint

    def initializer
      @endpoint = Client.endpoint
    end
  end
end
