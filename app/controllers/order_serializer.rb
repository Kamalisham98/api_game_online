class OrderSerializer < ActiveModel::Serializer
  attributes(
    :nickname,
    :server_game_id,
    :payment_method,
    :product_type,
    :game_name,
    :total_price,
    :order_status
  )
end
