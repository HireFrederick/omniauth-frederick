# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/frederick/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'omniauth-oauth2', '~> 1.1', '<= 1.3.1'
  spec.name         = 'omniauth-frederick'
  spec.version     = OmniAuth::Frederick::VERSION
  spec.date        = '2014-07-30'
  spec.summary     = "Frederick OmniAuth Strategy"
  spec.description = "OmniAuth strategy for the Frederick API using OAuth2"
  spec.authors     = ["Frederick"]
  spec.email       = 'friends@hirefrederick.com'
  spec.files       = %w(omniauth-frederick.gemspec)
  spec.files       += Dir.glob('lib/**/*.rb')
  spec.homepage    = 'https://github.com/hirefrederick/omniauth-frederick'
  spec.licenses    = %w(MIT)

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
