class ProductController < ApplicationController
  def index
    products = ::Products::IndexManager.execute(params: index_params)

    render(
      json: products,
      root: :products,
      each_serializer: ::ProductSerializer
    )
  end

  private

  def index_params
    params.permit(
      :name,
      :selling_price,
      :original_price,
      :is_disable,
      :product_type,
      :game_name
    ).to_h
  end
end
