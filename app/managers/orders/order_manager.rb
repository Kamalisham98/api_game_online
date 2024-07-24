module Orders
    class CreateManager
      # param params [Hash] - product attributes
      def self.execute(params:)
        order = Order.create(
            nickname: params{:nickname},
            server_game_id: params{:server_game_id},
            payment_method: params{:payment_method},
            product_type: params{:product_type},
            game_name: params{:game_name},
            total_price: params{:total_price},
            order_status: params{:order_status}
        )
        
  
        return order
      end
    end
  end