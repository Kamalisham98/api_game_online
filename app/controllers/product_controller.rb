class ProductController < ApplicationController
  def index
    products = Product.where(
      game_name: index_params[:game_name],
      product_type: index_params[:product_type]
    )

    render(
      json: products,
      root: :products,
      each_serializer: ::ProductSerializer
    )
  end

  private

  def index_params
    params.permit(
      # :name,
      # :selling_price,
      # :original_price,
      # :is_disable,
      :product_type,
      :game_name
    )
  end
end
