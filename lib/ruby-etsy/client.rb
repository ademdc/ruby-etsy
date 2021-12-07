require 'rest-client'
require 'json'
require 'http-parser'

class RubyEtsy
  class Client

    REFRESH_TOKEN_URL='https://api.etsy.com/v3/public/oauth/token'
    
    attr_accessor :access_token, :refresh_token, :api_key, :api_secret

    def initialize(access_token:, refresh_token:, api_key:, api_secret:) 
      RubyEtsy.configure

      @access_token  = access_token  || RubyEtsy.config.access_token
      @refresh_token = refresh_token || RubyEtsy.config.refresh_token
      @api_key       = api_key       || RubyEtsy.config.api_key
      @api_secret    = api_secret    || RubyEtsy.config.api_secret
    end

    def action(url, payload: {}, http_method: :post)
      headers = {
        'User-Agent': "RubyEtsy client v#{RubyEtsy::VERSION})",
        'x-api-key': api_key,
        'Authorization': "Bearer #{access_token}" 

      }

      response = ::RestClient::Request.execute(
        method:     http_method, 
        url:        url,
        payload:    payload.to_json, 
        headers:    headers,
        timeout:    5, 
        verify_ssl: ::OpenSSL::SSL::VERIFY_NONE
      )
      
      # RubyEtsy::Response.parse(response)
      parsed = JSON.parse(response.body)
      ::HttpParser.parse(response)
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
      access_token  = parsed['access_token']
      refresh_token = parsed['refresh_token']

      ::HttpParser.parse(response)
    end
  end
end