require 'ruby-etsy/client'
require 'ruby-etsy/calls'
require 'ruby-etsy/version'
require 'ruby-etsy/configuration'
# require 'ruby-etsy/urls'
# require 'ruby-etsy/response'
require 'byebug'


class RubyEtsy
  include Calls
  
  attr_accessor :client
  
  def initialize(access_token:, refresh_token:, api_key:, api_secret:)
    @client = Client.new(access_token: access_token, refresh_token: refresh_token, api_key: api_key, api_secret: api_secret)
  end
end