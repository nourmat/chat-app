class Chat::UpdateMessageCountJob < ApplicationJob
  queue_as :count_update

  def perform(*args)
    Chat.all.find_each do |chat|
      message_count = chat.messages.count
      # using update instead of update_all in case we want to run validations
      # Since it's a background job better to apply to best practices
      chat.update!(message_count: message_count)
    end
  end
end
