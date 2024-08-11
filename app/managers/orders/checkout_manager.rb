module Orders
  class CheckoutManager
    # param params [Hash] - product attributes {id:, server}
    # return [String] - nickanme
    def self.execute(params:)
      url = ENV['DOMAIN_CHECK_USERNAME']
      uri = URI(url)

      request_params = {
        country: 'ID',
        userId: params[:id],
        zoneId: params[:zone],
        voucherTypeName: 'MOBILE_LEGENDS'
      }
      res = Net::HTTP.post_form(uri, request_params)

      product = Product.find_by(id: params[:product_id])

      payment = Payment.find_by(id: params[:payment_id])

      check_user_validator = ::Orders::CheckoutValidator.new(
        response: JSON.parse(res.body).with_indifferent_access,
        product: product,
        payment: payment
      )
      if check_user_validator.invalid?
        raise ErrorHandlers.new(
          title: 'Failed to Get Nickname',
          message: check_user_validator.errors.messages
        )
      end

      res_body = JSON.parse(res.body).with_indifferent_access
      # example response
      # res.body
      #   "result": {
      #     "create_role_country": "id",
      #     "this_login_country": "id",
      #     "timestamp": 1723192653,
      #     "user_reg_time": "1487302349",
      #     "username": "HYDE"
      # }

      {
        username: res_body[:result][:username],
        product_selling_price: product.selling_price,
        product_type: product.product_type,
        payment_method: payment.name
      }
    end
  end
end
