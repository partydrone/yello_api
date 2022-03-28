class AuthenticationController < ApplicationController
  skip_before_action :authenticate_token!

  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      render json: { token: JsonWebToken.encode(sub: user.id) }
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end
end
