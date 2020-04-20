class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :receiver, null: false
      t.string :postal_code, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :after, null: false

      t.timestamps
    end
    add_foreign_key :addresses, :users
  end
end
