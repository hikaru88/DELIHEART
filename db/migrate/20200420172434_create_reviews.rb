class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.text :text
      t.integer :score, null: false

      t.timestamps
    end
    add_index :reviews, :from_user_id
    add_index :reviews, :to_user_id
  end
end
