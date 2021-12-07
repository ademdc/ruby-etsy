require 'bundler/setup'
require 'rspec'

require './lib/ruby-etsy'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end