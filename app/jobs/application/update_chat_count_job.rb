class Application::UpdateChatCountJob < ApplicationJob
  queue_as :count_update

  def perform
    puts "Running Application::UpdateChatCountJob now"

    Application.all.find_each do |app|
      chat_count = app.chats.count
        # using update instead of update_all in case we want to run validations
        # Since it's a background job better to apply to best practices
      app.update!(chat_count: chat_count)
    end
  end
end
