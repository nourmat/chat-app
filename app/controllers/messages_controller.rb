class MessagesController < ApplicationController
  def index
    app = get_app_from_params
    return render server_error_app_token unless app

    chat = get_chat_by_app_and_number(app)
    return render server_error_chat_number unless chat

    render json: chat.messages.all.select(:number_id, :body).as_json(:except => :id)
  end

  def create
    app = get_app_from_params
    return render server_error_app_token unless app

    chat = get_chat_by_app_and_number(app)
    return render server_error_chat_number unless chat

    chat.last_message_number # making sure the key is set
    new_number_id = Rails.cache.increment(chat.last_message_number_redis_key)

    Message::CreateJob.perform_async(chat.id, new_number_id, params[:body])

    render json: {
      "number": new_number_id,
      "body": params[:body],
    }, status: :ok
  end

  def search_text
    app = get_app_from_params
    return render server_error_app_token unless app

    chat = get_chat_by_app_and_number(app)
    return render server_error_chat_number unless chat

    text = params[:text]
    return render server_error("Text is empty or invalid") unless text

    # Simple pagination
    page = params[:page].to_i || 0
    page = page * 10 # Size should be moved to const paging

    response = Message.search(text, chat.id, page)
    results = response.pluck(:number_id, :body).to_json

    render json: results, status: :ok
  end

  private

  def get_chat_by_app_and_number(app)
    chat_number_id = params[:chat_number_id]
    app.chats.find_by(number_id: chat_number_id)
  end

  def server_error_chat_number
    server_error("Chat number is empty or invalid")
  end
end
