class Message < ApplicationRecord
  include ElasticSearchable

  belongs_to :chat
end

# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :bigint           not null
#  number_id  :integer          not null
#
# Indexes
#
#  index_messages_on_chat_id_and_number_id  (chat_id,number_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (chat_id => chats.id)
#
