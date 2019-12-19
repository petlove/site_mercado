# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'
require 'support/configs/simple_cov_config'
require 'dotenv'
require "faker"
require 'site_mercado'

SimpleCovConfig.configure

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))].sort.each do |f|
  require f
end

VCRConfig.configure
Dotenv.load

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
