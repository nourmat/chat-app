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
require "test_helper"

class ChatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
