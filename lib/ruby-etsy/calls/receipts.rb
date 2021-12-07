class RubyEtsy
  module Calls
    module Receipts

      def get_receipts(query_params={})
        client.action("/shops/#{client.shop_id}/receipts", http_method: :get, query_params: query_params)
      end

      def get_receipt(id)
        client.action("/shops/#{client.shop_id}/receipts/#{id}", http_method: :get)
      end
    end
  end
end