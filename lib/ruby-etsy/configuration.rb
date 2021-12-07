class RubyEtsy
  class << self
    # Accessor for global configuration.
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config) if block_given?
  end

  class Configuration
    attr_accessor :access_token, :refresh_token, :api_key, :api_secret, :shop_id

    def initialize
      @access_token    = nil
      @refresh_token   = nil
      @api_key         = nil
      @api_secret      = nil
      @shop_id         = nil
    end
  end
end