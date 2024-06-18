module Products
  class ShowManager
    # param params [Hash] - product attributes
    def self.execute(params:)
      product = Product.find_by(id: params[:id])

      validator = ShowValidator.new(product: product)
      validator.errors.messages
      if validator.invalid?
        error = StandardError.new({ status: 404, message: validator.errors.messages })
        raise error
      end
      product
    end
  end
end
