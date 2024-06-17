class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :game_id
      t.string :game_server
      t.string :whatsapp_number
      t.string :email
      t.timestamps
    end
  end
end
