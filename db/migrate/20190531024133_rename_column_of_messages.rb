class RenameColumnOfMessages < ActiveRecord::Migration[5.2]
  def change
    rename_column :messages, :chat_room, :chat_room_id
  end
end
