class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.integer :surprise_id
      t.integer :user_id
      t.boolean :is_available, null: false, default: false

      t.timestamps
    end
  end
end
