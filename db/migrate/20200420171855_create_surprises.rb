class CreateSurprises < ActiveRecord::Migration[5.2]
  def change
    create_table :surprises do |t|
      t.integer :user_id
      t.string :name, index: true, null: false
      t.text :description
      t.integer :price, null: false
      t.boolean :is_active, default: true, null: false
      t.string :main_image_id
      t.integer :postage, null: false

      t.timestamps
    end
    add_foreign_key :surprises, :users
  end
end
