# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'
require 'support/configs/simple_cov_config'
require 'dotenv'

SimpleCovConfig.configure

require 'site_mercado'

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))].sort.each do |f|
  require f
end

VCRConfig.configure
Dotenv.load

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
