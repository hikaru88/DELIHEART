class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.integer :user_id
      t.string :title, null: false
      t.text :text, null: false
      t.boolean :already_read, null: false, default: false

      t.timestamps
    end
    add_foreign_key :notices, :users
  end
end
