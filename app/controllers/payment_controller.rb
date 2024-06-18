class PaymentController < ApplicationController
  def index
    payments = ::Payments::IndexManager.execute(params: index_params)

    render(
      json: payments,
      root: :payments,
      each_serializer: ::PaymentSerializer
    )
  end

  def show
    payment = ::Payments::ShowManager.execute(params: show_params)

    render(
      json: payment,
      root: :payment,
      each_serializer: ::PaymentSerializer
    )
  end

  private

  def index_params
    params.permit(
      :name,
      :image_url
    ).to_h
  end

  def show_params
    params.permit(
      :id
    ).to_h
  end
end
