# frozen_string_literal: true

module SiteMercado
  class Configuration
    attr_accessor :client_id, :client_secret, :endpoint, :api_version

    def self.default_url
      'https://service.sitemercado.com.br/'
    end

    def initialize
      @endpoint = ENV['SITEMERCADO_URL'] || self.class.default_url
      @api_version = ENV['SITEMERCADO_API_VERSION'] || '/api/v1/'
    end
  end
end
