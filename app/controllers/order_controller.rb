class OrderController < ApplicationController
  def create
    order = ::Orders::CreateManager.execute(params: create_params)

    render(
      json: orders,
      root: :orders,
      each_serializer: ::OrderSerializer
    )
  end

  def show
    order = ::Orders::ShowManager.execute(params: show_params)

    render(
      json: order,
      root: :order,
      serializer: ::OrderSerializer
    )
  end

  private

  def create_params
    params.permit(
      :nickname,
      :server_game_id,
      :payment_method,
      :product_type,
      :game_name,
      :total_price,
      :order_status
    ).to_h
  end

  def show_params
    params.permit(
      :id
    ).to_h
  end
end
