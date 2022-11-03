# frozen_string_literal: true

module SiteMercado
  class Configuration
    attr_accessor :client_id, :client_secret, :endpoint, :api_version

    def initialize
      @endpoint = ENV.fetch('SITEMERCADO_URL', 'https://service.sitemercado.com.br/')
      @api_version = ENV.fetch('SITEMERCADO_API_VERSION', '/api/v1')
      @client_id = ENV.fetch('SITEMERCADO_CLIENT_SECRET', '')
      @client_secret = ENV.fetch('SITEMERCADO_CLIENT_ID', '')
    end
  end
end
