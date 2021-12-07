require 'rest-client'
require 'json'
require 'http-parser'
require 'active_support'
require 'active_support/core_ext'

class RubyEtsy
  class Client

    REFRESH_TOKEN_URL='https://api.etsy.com/v3/public/oauth/token'
    V3_URL='https://openapi.etsy.com/v3/application'

    attr_accessor :access_token, :refresh_token, :api_key, :api_secret, :shop_id

    def initialize(access_token:, refresh_token:, api_key:, api_secret:, shop_id:) 
      RubyEtsy.configure

      @access_token  = access_token  || RubyEtsy.config.access_token
      @refresh_token = refresh_token || RubyEtsy.config.refresh_token
      @api_key       = api_key       || RubyEtsy.config.api_key
      @api_secret    = api_secret    || RubyEtsy.config.api_secret
      @shop_id       = shop_id       || RubyEtsy.config.shop_id
    end

    def action(url, payload: {}, query_params: {}, http_method: :post)
      headers = {
        'User-Agent': "RubyEtsy client v#{RubyEtsy::VERSION})",
        'x-api-key': api_key,
        'Authorization': "Bearer #{access_token}" 
      }
      
      response = ::RestClient::Request.execute(
        method:     http_method, 
        url:        construct_url(url, query_params),
        payload:    payload.to_json, 
        headers:    headers,
        timeout:    5, 
        verify_ssl: ::OpenSSL::SSL::VERIFY_NONE
      )
      
      ::HttpParser.parse(response)
    rescue RestClient::Unauthorized => e
      puts "RESCUED UNATHORIZED"
      
      refresh_token
      action(url, http_method: :get)
    end

    def refresh_token
      payload = {
        grant_type:    :refresh_token,
        refresh_token: @refresh_token,
        client_id:     @api_key
      }

      response = ::RestClient::Request.execute(
        method:     :post, 
        url:        REFRESH_TOKEN_URL,
        payload:    payload.to_json, 
        headers:    { content_type: :json, accept: :json },
        timeout:    5,
        verify_ssl: ::OpenSSL::SSL::VERIFY_NONE
      )

      parsed        = JSON.parse(response.body)
      @access_token  = parsed['access_token']
      @refresh_token = parsed['refresh_token']

      puts parsed 

      ::HttpParser.parse(response)
    end

    private

    def construct_url(url, query_params={})
      query = query_params.present? ? URI.encode_www_form(query_params).prepend('?') : ""
      "#{V3_URL}#{url}#{query}"
    end
  end
end