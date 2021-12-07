require 'ruby-etsy/client'
require 'ruby-etsy/calls'
require 'ruby-etsy/version'
require 'ruby-etsy/configuration'
require 'byebug'

class RubyEtsy
  include Calls
  
  attr_accessor :client

  def initialize(access_token:, refresh_token:, api_key:, api_secret:, shop_id:)
    @client = Client.new(access_token: access_token, refresh_token: refresh_token, api_key: api_key, api_secret: api_secret, shop_id: shop_id)
  end
end