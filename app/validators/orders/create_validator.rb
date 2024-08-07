module Orders
  class CreateValidator
    REQUIRED_PARAMS = %i[nickname server_game_id payment_method product_type game_name total_price order_status]

    def self.validate(params)
      missing_params = REQUIRED_PARAMS.select { |param| params[param].blank? }
      return if missing_params.empty?

      raise StandardError.new("Missing required params: #{missing_params.join(', ')}") if missing_params.any?
    end
  end
end
