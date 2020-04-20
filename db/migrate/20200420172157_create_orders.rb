class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :surprise_id
      t.integer :payment_method, null: false
      t.integer :status, null: false, default: 0
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :surprise_name, null: false
      t.string :surprise_image_id

      t.timestamps
    end
    add_foreign_key :orders, :users
    add_foreign_key :orders, :surprises
  end
end
