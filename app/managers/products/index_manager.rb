module Products
  class IndexManager
    # param params [Hash] - product attributes
    def self.execute(params:)
      products = Product
      products = FilterUtil.where_like(
        collection: products,
        filter_params: params
      )

      products.where(is_disable: false)
    end
  end
end
