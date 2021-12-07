class RubyEtsy
  module Calls
    module Receipts

      def get_receipts
        client.action("/shops/#{client.shop_id}/receipts", http_method: :get)
      end

      def get_receipt(id)
        client.action("/shops/#{client.shop_id}/receipts/#{id}", http_method: :get)
      end
    end
  end
end