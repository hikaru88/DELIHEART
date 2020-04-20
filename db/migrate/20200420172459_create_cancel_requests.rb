class CreateCancelRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :cancel_requests do |t|
      t.integer :user_id
      t.integer :order_id
      t.text :reason, null: false

      t.timestamps
    end
    add_foreign_key :cancel_requests, :users
    add_foreign_key :cancel_requests, :orders
  end
end
