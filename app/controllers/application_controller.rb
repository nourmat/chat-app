class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private

  def get_app_from_params
    Application.find_by(token: params[:app_token])
  end

  def server_error_app_token
    server_error("Application token is empty or invalid")
  end

  def server_error(message = nil)
    { json: {"message": message || "Error Occurred"}, status: 500 } #Internal Server Error
  end
end
