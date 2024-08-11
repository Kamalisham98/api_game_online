module Orders
  class CheckoutValidator
    # REQUIRED_PARAMS = %i[nickname server_game_id payment_method product_type game_name total_price order_status]
    include ActiveModel::Validations

    attr_accessor :response,
                  :product,
                  :payment

    validates_presence_of(:product, message: 'Product not found')
    validates_presence_of(:payment, message: 'Payment not found')

    validate :check_response
    validate :product_price_exist?,  if: -> { @product.present? }
    validate :payment_method_exist?, if: -> { @payment.present? }
    validate :payment_aviable?, if: -> { @payment.present? }

    def initialize(
      response:,
      product:,
      payment:
    )
      @response = response
      @product = product
      @payment = payment
    end

    def check_response
      return if @response[:result]

      errors.add(:nickname, 'nickname not found')
    end

    def product_price_exist?
      return if @product.selling_price

      errors.add(:product, "product doesn't have price")
    end

    def payment_method_exist?
      return if @product.selling_price

      errors.add(:payment, "payment doesn't have name")
    end

    def payment_aviable?
      return unless @payment.is_disable?

      errors.add(:payment, 'Payment is disable')
    end
  end
end
