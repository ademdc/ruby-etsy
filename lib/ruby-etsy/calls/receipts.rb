class RubyEtsy
  module Calls
    module Receipts

      def get_receipts
        "puts receipts"

        client.action('https://openapi.etsy.com/v3/application/shops/31969853/receipts', http_method: :get)
      end
    end
  end
end