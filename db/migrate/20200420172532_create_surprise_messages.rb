class CreateSurpriseMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :surprise_messages do |t|
      t.integer :user_id
      t.integer :surprise_id
      t.text :text, null: false

      t.timestamps
    end
    add_foreign_key :surprise_messages, :users
    add_foreign_key :surprise_messages, :surprises
  end
end
