class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.integer :number_id, null: false
      t.integer :message_count, null: false, default: 0
      t.bigint :application_id, null: false

      t.index [:application_id, :number_id], unique: true

      t.timestamps
    end

    add_foreign_key :chats, :applications
  end
end
