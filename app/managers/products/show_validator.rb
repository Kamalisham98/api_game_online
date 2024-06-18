module Products
  class ShowValidator
    include ActiveModel::Validations

    attr_accessor :product

    validates_presence_of(:product, message: 'product tidak ditemukan')

    def initialize(product:)
      @product = product
    end
  end
end
