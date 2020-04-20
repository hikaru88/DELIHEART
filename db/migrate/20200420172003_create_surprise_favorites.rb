class CreateSurpriseFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :surprise_favorites do |t|
      t.integer :user_id
      t.integer :surprise_id

      t.timestamps
    end
    add_foreign_key :surprise_favorites, :users
    add_foreign_key :surprise_favorites, :surprises
  end
end
