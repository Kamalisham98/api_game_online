module Orders
  class CheckoutManager
    # param params [Hash] - product attributes {id:, server}
    # return [String] - nickanme
    def self.execute(params:)
      url = ENV['DOMAIN_CHECK_USERNAME']
      uri = URI(url)

      params = {
        country: 'ID',
        userId: params[:id],
        zoneId: params[:zone],
        voucherTypeName: 'MOBILE_LEGENDS'
      }
      res = Net::HTTP.post_form(uri, params)
      puts res.body
      # # ::Net::HTTP.post(uri)
      res.body
    end
  end
end
