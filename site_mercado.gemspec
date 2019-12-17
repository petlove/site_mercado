# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'site_mercado/version'

Gem::Specification.new do |spec|
  spec.name          = 'SiteMercado'
  spec.version       = SiteMercado::VERSION
  spec.authors       = ['Petlove']
  spec.email         = ['tecnologia@petlove.com.br']

  spec.licenses      = ['MIT']
  spec.summary       = 'Simple integration with Site Mercado API'
  spec.description   = 'Simple integration with Site Mercado API'
  spec.homepage      = 'https://github.com/petlove/site_mercado'

  spec.files         = Dir['{lib}/**/*', 'CHANGELOG.md', 'MIT-LICENSE', 'README.md']
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3.0'

  spec.add_runtime_dependency 'faraday'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler', '~> 2.0.2'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
end
