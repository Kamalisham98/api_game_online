class ProductSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :selling_price,
    :original_price,
    :is_disable,
    :product_type,
    :game_name,
    :created_at,
    :updated_at
  )
end
