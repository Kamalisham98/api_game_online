row_data = [
  {
    name: 'Shopee Pay',
    image_url: 'shopeepay.png'
  },
  {
    name: 'GoPay',
    image_url: 'gopay.png'
  },
  {
    name: 'Qris',
    image_url: 'qris.png'
  },
  {
    name: 'BCA VA',
    image_url: 'bca.png'
  },
  {
    name: 'BNI VA',
    image_url: 'BNI.png'
  },
  {
    name: 'BRI VA',
    image_url: 'BRI.png'
  },
  {
    name: 'Mandiri VA',
    image_url: 'Mandiri.png'
  },
  {
    name: 'Permata Bank VA',
    image_url: 'permatabank.png'
  },
  {
    name: 'ATM Bersama',
    image_url: 'atmbersama.png'
  },
  {
    name: 'Prima',
    image_url: 'prima.png'
  },
  {
    name: 'ALTO',
    image_url: 'alto.png'
  },
  {
    name: 'CIMB Niaga VA',
    image_url: 'CIMB.png'
  }
]

row_data.each do |row|
  Payment.create!(
    name: row[:name],
    image_url: row[:image_url],
    is_disable: false
  )
end
