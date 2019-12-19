# frozen_string_literal: true

require 'site_mercado/version'
require 'site_mercado/client'
require 'site_mercado/configuration'
require 'site_mercado/oauth'

require 'site_mercado/resources/v1/event'
require 'site_mercado/resources/v1/order'

require 'site_mercado/entities/base'
require 'site_mercado/entities/address'
require 'site_mercado/entities/customer'
require 'site_mercado/entities/order'

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
