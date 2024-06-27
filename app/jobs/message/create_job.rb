class Message::CreateJob < ApplicationJob
  queue_as :default

  def perform(chat_id, new_number_id, body)
    chat = Chat.find(chat_id)
    chat.messages.create(number_id: new_number_id, body: body)

    chat.chat_metadata.update!(last_message_number: new_number_id)
  end
end
