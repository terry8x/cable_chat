class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :user_id
      t.integer :chat_room

      t.timestamps
    end
  end
end
