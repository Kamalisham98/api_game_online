# Run this seed if you don't have product data

# task:
# rails db:seed:file SEED_FILE=add_product_mobile_legend

# by executing task on CLI, u will get 35 product data
file = File.join(Rails.root, 'app/assets/csv/product_mobile_legend.csv')
table = CSV.parse(File.read(file), headers: true)

table.each do |row|
  Product.create!(
    name: row['Name'],
    selling_price: row['Selling Price'],
    original_price: row['Original Price'],
    is_disable: false,
    product_type: row['Product Type'],
    game_name: 'mobile_legend'
  )
end
