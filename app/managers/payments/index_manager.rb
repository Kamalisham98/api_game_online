module Payments
  class IndexManager
    # param params [Hash] - product attributes
    def self.execute(params:)
      payments = Payment
      payments = FilterUtil.where_like(
        collection: payments,
        filter_params: params
      )

      payments.where(is_disable: false)
    end
  end
end
