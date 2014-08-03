lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/frederick/version'

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
  gem.name         = 'omniauth-frederick'
  gem.version     = OmniAuth::Frederick::VERSION
  gem.date        = '2014-07-30'
  gem.summary     = "Frederick OmniAuth Strategy"
  gem.description = "OmniAuth strategy for the Frederick API using OAuth2"
  gem.authors     = ["Frederick"]
  gem.email       = 'friends@hirefrederick.com'
  gem.files       = %w(omniauth-frederick.gemspec)
  gem.files       += Dir.glob('lib/**/*.rb')
  gem.homepage    = 'https://github.com/hirefrederick/omniauth-frederick'
  gem.licenses    = %w(MIT)

  gem.required_ruby_version = '>= 1.9.3'
end
