# Run this seed if you don't have product data

# task:
# rails db:seed:file SEED_FILE=add_product_genshin_impact

# by executing task on CLI, u will get 35 product data
file = File.join(Rails.root, 'app/assets/csv/product_genshin_impact.csv')
table = CSV.parse(File.read(file), headers: true)

table.each do |row|
  Product.create!(
    name: row['Name'],
    selling_price: row['Selling Price'],
    original_price: row['Original Price'],
    is_disable: false,
    product_type: row['Product Type'],
    game_name: 'genshin_impact'
  )
end