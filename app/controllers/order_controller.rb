class OrderController < BaseController
  skip_before_action :verify_authenticity_token

  def create
    orders = ::Orders::CreateManager.execute(params: create_params)

    render(
      json: orders,
      root: :orders,
      each_serializer: ::OrderSerializer
    )
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def show
    order = ::Orders::ShowManager.execute(params: show_params)

    render(
      json: order,
      root: :order,
      serializer: ::OrderSerializer
    )
  end

  def checkout
    checkout = ::Orders::CheckoutManager.execute(params: checkout_params)
    render(
      json: checkout
      # root: :order,
      # serializer: ::OrderSerializer
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

  def checkout_params
    params.permit(
      :id,
      :zone,
      :product_id,
      :payment_id
    ).to_h
  end
end
