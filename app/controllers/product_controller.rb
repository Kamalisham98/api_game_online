class ProductController < ApplicationController
  def index
    products = ::Products::IndexManager.execute(params: index_params)

    render(
      json: products,
      root: :products,
      each_serializer: ::ProductSerializer
    )
  end

  def show
    product = ::Products::ShowManager.execute(params: show_params)

    render(
      json: product,
      root: :product,
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

  def show_params
    params.permit(
      :id
    ).to_h
  end
end
