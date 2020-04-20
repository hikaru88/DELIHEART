class CreateOrderMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :order_messages do |t|
      t.integer :user_id
      t.integer :order_id
      t.text :text, null: false

      t.timestamps
    end
    add_foreign_key :order_messages, :users
    add_foreign_key :order_messages, :orders
  end
end
