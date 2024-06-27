class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :token, null: false, index: { unique: true }
      t.string :name, null: false
      t.integer :chat_count, null: false, default: 0

      t.timestamps
    end
  end
end
