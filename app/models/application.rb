class Application < ApplicationRecord
  has_one :application_metadata, dependent: :destroy
  has_many :chats, dependent: :destroy

  after_create :create_application_metadata

  def last_chat_number
    Rails.cache.fetch(last_chat_number_redis_key, raw: true) do
      application_metadata.last_chat_number
    end
  end

  def last_chat_number_redis_key
    "app_chat_metadata_#{id}"
  end

  private

  def create_application_metadata
    create_application_metadata!(application_id: id)
  end
end

# == Schema Information
#
# Table name: applications
#
#  id         :bigint           not null, primary key
#  chat_count :integer          default(0), not null
#  name       :string(255)      not null
#  token      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_applications_on_token  (token) UNIQUE
#
