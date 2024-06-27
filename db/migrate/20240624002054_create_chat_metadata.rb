class CreateChatMetadata < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_metadata do |t|
      t.bigint :chat_id, null: false, index: { unique: true }
      t.integer :last_message_number, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :chat_metadata, :chats
  end
end
