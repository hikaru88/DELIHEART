class CreateSurpriseImages < ActiveRecord::Migration[5.2]
  def change
    create_table :surprise_images do |t|
      t.integer :surprise_id
      t.string :image_id, null: false

      t.timestamps
    end
    add_foreign_key :surprise_images, :surprises
  end
end
