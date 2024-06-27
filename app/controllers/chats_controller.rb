class ChatsController < ApplicationController
  def index
    app = get_app_from_params
    return render server_error_app_token unless app

    render json: app.chats.all.select(:number_id, :message_count).as_json(:except => :id)
  end

  def create
    app = get_app_from_params
    return render server_error_app_token unless app

    app.last_chat_number # making sure the key is set form db
    new_number_id = Rails.cache.increment(app.last_chat_number_redis_key)

    Chat::CreateJob.perform_async(app.id, new_number_id)

    render json: { "number": new_number_id }, status: :ok
  end
end
