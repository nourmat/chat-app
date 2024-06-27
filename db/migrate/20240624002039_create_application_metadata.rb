class CreateApplicationMetadata < ActiveRecord::Migration[7.1]
  def change
    create_table :application_metadata do |t|
      t.bigint :application_id, null: false, index: { unique: true }
      t.integer :last_chat_number, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :application_metadata, :applications
  end
end
