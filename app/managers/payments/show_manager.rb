module Payments
  class ShowManager
    # param params [Hash] - product attributes
    def self.execute(params:)
      payment = Payment.find_by(id: params[:id])

      validator = ShowValidator.new(payment: payment)
      validator.errors.messages
      if validator.invalid?
        error = StandardError.new({ status: 404, message: validator.errors.messages })
        raise error
      end
      payment
    end
  end
end
