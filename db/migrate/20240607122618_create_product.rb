class CreateProduct < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :selling_price
      t.integer :original_price
      t.boolean :is_disable, default: false, null: false
      t.string :product_type
      t.string :game_name
      t.timestamps
    end
  end
end
