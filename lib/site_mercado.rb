# frozen_string_literal: true

require 'site_mercado/version'
require 'site_mercado/client'
require 'site_mercado/configuration'
require 'site_mercado/oauth'

require 'site_mercado/resources/v1/event'
require 'site_mercado/resources/v1/order'
require 'site_mercado/resources/v1/product'

require 'site_mercado/entities/base'
require 'site_mercado/entities/event'
require 'site_mercado/entities/address'
require 'site_mercado/entities/customer'
require 'site_mercado/entities/order'
require 'site_mercado/entities/payment'
require 'site_mercado/entities/item'
require 'site_mercado/entities/transaction'
require 'site_mercado/entities/product'

require 'site_mercado/errors/bad_request_error'
require 'site_mercado/errors/unautorized_error'
require 'site_mercado/errors/unknown_status_error'
require 'site_mercado/errors/precondition_failed_error'
require 'site_mercado/errors/resource_not_found_error'

require 'site_mercado/helpers/order_parser'

module SiteMercado
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
