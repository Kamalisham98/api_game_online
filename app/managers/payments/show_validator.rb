module Payments
  class ShowValidator
    include ActiveModel::Validations

    attr_accessor :payment

    validates_presence_of(:payment, message: 'payment tidak ditemukan')

    def initialize(payment:)
      @payment = payment
    end
  end
end
