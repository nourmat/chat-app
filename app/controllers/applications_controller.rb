class ApplicationsController < ApplicationController
  def index
    render json: Application.all.select(:name, :token, :chat_count).as_json(:except => :id)
  end

  def create
    name = params[:name]
    token = SecureRandom.uuid

    return render server_error("Name not found") if name.blank?

    Application.create!(name: name, token: token)

    render json: { "token": token }, status: :ok
  end
end
