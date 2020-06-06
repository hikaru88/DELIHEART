class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :active_id
      t.integer :passive_id
      t.integer :status, null: false

      t.timestamps
    end
    add_index :relationships, :active_id
    add_index :relationships, :passive_id
    add_index :relationships, [:active_id, :passive_id], unique: true
  end
end
