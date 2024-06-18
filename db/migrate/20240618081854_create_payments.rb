class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string :name
      t.string :image_url
      t.boolean :is_disable, default: false, null: false
      t.timestamps
    end
  end
end
