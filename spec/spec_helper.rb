# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'
require 'simplecov-console'
require 'support/configs/simple_cov_config'

SimpleCovConfig.configure

require 'dotenv'
require 'faker'
require 'site_mercado'
require 'pry'
require 'factory_bot'

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))].each do |f|
  require f
end

VCRConfig.configure
Dotenv.load

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include DocumentMacros
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.before do |example|
    if example.metadata[:vcr]
      SiteMercado.config do |c|
        c.client_id = ENV.fetch('SITEMERCADO_CLIENT_ID', nil)
        c.client_secret = ENV.fetch('SITEMERCADO_CLIENT_SECRET', nil)
      end
    end
  end
end
