class Chat < ApplicationRecord
  has_one :chat_metadata, dependent: :destroy
  belongs_to :application
  has_many :messages, dependent: :destroy

  after_create :create_chat_metadata

  def last_message_number
    Rails.cache.fetch(last_message_number_redis_key, raw: true) do
      chat_metadata.last_message_number
    end
  end

  def last_message_number_redis_key
    "chat_message_number_key_#{id}"
  end

  private

  def create_chat_metadata
    create_chat_metadata!(chat_id: id)
  end
end

# == Schema Information
#
# Table name: chats
#
#  id             :bigint           not null, primary key
#  message_count  :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  application_id :bigint           not null
#  number_id      :integer          not null
#
# Indexes
#
#  index_chats_on_application_id_and_number_id  (application_id,number_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (application_id => applications.id)
#
