# frozen_string_literal: true

module SiteMercado
  class Configuration
    attr_accessor :client_id, :client_secret, :endpoint, :api_version

    def initialize
      @endpoint = ENV['SITEMERCADO_URL'] || 'https://service.sitemercado.com.br/'
      @api_version = ENV['SITEMERCADO_API_VERSION'] || '/api/v1/'
    end
  end
end
