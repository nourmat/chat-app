class ChatMetadata < ApplicationRecord
  belongs_to :chat
end

# == Schema Information
#
# Table name: chat_metadata
#
#  id                  :bigint           not null, primary key
#  last_message_number :integer          default(0), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  chat_id             :bigint           not null
#
# Indexes
#
#  index_chat_metadata_on_chat_id  (chat_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (chat_id => chats.id)
#
