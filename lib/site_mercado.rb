# frozen_string_literal: true

require 'site_mercado/version'
require 'site_mercado/client'
require 'site_mercado/configuration'
require 'site_mercado/oauth'

require 'site_mercado/resources/v1/event'
require 'site_mercado/resources/v1/order'

module SiteMercado
  class Error < StandardError; end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def config
      yield(configuration)
    end

    def oauth
      @oauth ||= Oauth.new
    end
  end
end
