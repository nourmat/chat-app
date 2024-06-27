class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.integer :number_id, null: false
      t.bigint :chat_id, null: false
      t.text :body

      t.index [:chat_id, :number_id], unique: true

      t.timestamps
    end

    add_foreign_key :messages, :chats
  end
end
