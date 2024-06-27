class Chat::CreateJob < ApplicationJob
  sidekiq_options queue: 'default'

  def perform(app_id, new_number_id)
    app = Application.find(app_id)
    app.chats.create(number_id: new_number_id)

    app.application_metadata.update!(last_chat_number: new_number_id)
  end
end
