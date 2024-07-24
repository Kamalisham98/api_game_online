class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :nickname
      t.integer :server_game_id
      t.string :payment_method
      t.string :product_type
      t.string :game_name
      t.integer :total_price
      t.string :order_status

      t.timestamps
    end
  end
end
