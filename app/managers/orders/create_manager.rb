module Orders
  class CreateManager
    # param params [Hash] - product attributes
    def self.execute(params:)
      # ::Orders::CreateValidator.validate(params)

      validator = ::Orders::CreateValidator.new(params)

      if validator.invalid?
        raise ::ErrorHandlers.new(
          title: 'Cannot Create Order',
          message: validator.errors.messages
        )
      end

      Order.create(
        nickname: params [:nickname],
        server_game_id: params [:server_game_id],
        payment_method: params [:payment_method],
        product_type: params [:product_type],
        game_name: params [:game_name],
        total_price: params [:total_price],
        order_status: params [:order_status]
      )
    end
  end
end
