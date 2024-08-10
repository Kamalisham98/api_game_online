module Orders
  class CreateValidator
    # REQUIRED_PARAMS = %i[nickname server_game_id payment_method product_type game_name total_price order_status]
    include ActiveModel::Validations

    attr_accessor :nickname,
                  :server_game_id,
                  :payment_method,
                  :product_type,
                  :game_name,
                  :total_price,
                  :order_status

    validates_presence_of(:nickname, message: 'nickname not found')
    validates_presence_of(:server_game_id, message: 'game type not found')
    validates_presence_of(:payment_method, message: 'payment method not found')
    validates_presence_of(:product_type, message: 'product type not found')
    validates_presence_of(:game_name, message: 'game name not found')
    validates_presence_of(:total_price, message: 'total price not found')
    validates_presence_of(:order_status, message: 'order status not found')

    # validate(:check_payment_method)

    def initialize(params)
      @nickname = params[:nickname]
      @payment_method = params[:payment_method]
      @server_game_id = params[:server_game_id]
      @payment_method = params[:payment_method]
      @product_type = params[:product_type]
      @game_name = params[:game_name]
      @total_price = params[:total_price]
      @order_status = params[:order_status]
    end

    # def check_payment_method
    #   return if @payment_method == 'qris'

    #   errors.add(:payment_method, 'bukan qris')
    # end
  end
end
