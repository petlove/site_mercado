# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'site_mercado/version'

Gem::Specification.new do |spec|
  spec.name          = 'site_mercado'
  spec.version       = SiteMercado::VERSION
  spec.authors       = ['Petlove']
  spec.email         = ['tecnologia@petlove.com.br']

  spec.licenses      = ['MIT']
  spec.summary       = 'Integration with SiteMercado API'
  spec.description   = 'Supporting gem for comunication with SiteMercado API'
  spec.homepage      = 'https://github.com/petlove/site_mercado'

  spec.files = Dir['{lib}/**/*', 'CHANGELOG.md', 'MIT-LICENSE', 'README.md']
  spec.bindir = 'bin'
  spec.executable = 'sitemercado'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.6.0'

  spec.add_runtime_dependency 'awesome_print'
  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'oj'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'dotenv', '~> 2.7'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 1.10.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.9.0'
  spec.add_development_dependency 'simplecov', '>= 0.17.0'
  spec.add_development_dependency 'simplecov-console', '>= 0.6.0'
  spec.add_development_dependency 'vcr', '>= 5.0.0'
  spec.add_development_dependency 'webmock', '>= 3.7'
end
