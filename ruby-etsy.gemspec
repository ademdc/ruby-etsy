require_relative 'lib/ruby-etsy/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby-etsy'
  spec.version       = RubyEtsy::VERSION
  spec.authors       = ['Adem Dinarevic']
  spec.email         = ['ademdinarevic@gmail.com']
  spec.homepage      = 'https://github.com/ademdc/ruby-etsy'
  spec.license       = 'MIT'
  spec.summary       = "Ruby client for Etsy API"
  spec.description   = "Ruby client for Etsy API"
  spec.require_paths = ['lib']
  
  spec.files         =  %w[
    lib/ruby-etsy.rb
    lib/ruby-etsy/client.rb
    lib/ruby-etsy/calls.rb
    lib/ruby-etsy/version.rb
    lib/ruby-etsy/configuration.rb
    lib/ruby-etsy/urls.rb
    lib/ruby-etsy/response.rb
    lib/ruby-etsy/calls/info.rb
    lib/ruby-etsy/calls/messaging.rb
  ]

  spec.required_ruby_version = '>= 2.3'

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'rest-client', '~> 2.0'
  spec.add_dependency 'parse-http', '>= 1.0.1'
end