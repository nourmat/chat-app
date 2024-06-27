class ApplicationMetadata < ApplicationRecord
  belongs_to :application
end

# == Schema Information
#
# Table name: application_metadata
#
#  id               :bigint           not null, primary key
#  last_chat_number :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  application_id   :bigint           not null
#
# Indexes
#
#  index_application_metadata_on_application_id  (application_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (application_id => applications.id)
#
