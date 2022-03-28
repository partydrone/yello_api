class ApplicationController < ActionController::API
  include ::ActionController::MimeResponds

  before_action :authenticate_token!

  private

  def authenticate_token!
    payload = JsonWebToken.decode(auth_token)
    @current_user = User.find(payload[:sub]) if payload
  rescue JWT::ExpiredSignature
    render json: { errors: ["Token has expired"] }, status: :unauthorized
  rescue JWT::DecodeError
    render json: { errors: ["Invalid token"] }, status: :unauthorized
  end

  def auth_token
    @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
  end
end
