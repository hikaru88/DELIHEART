class CreateTargetAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :target_areas do |t|
      t.integer :surprise_id
      t.integer :name, null: false, default: 0

      t.timestamps
    end
    add_foreign_key :target_areas, :surprises
  end
end
