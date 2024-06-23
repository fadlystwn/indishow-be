class SessionsController < ApplicationController
  def create

    email = params[:user][:email]
    password = params[:user][:password]

    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      render json: @user
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
  def destroy
    if session[:user_id]
      session.delete(:user_id)
      render json: { message: "Logged out successfully" }
    else
      render json: { error: "User not logged in" }, status: :unprocessable_entity
    end
  end
end
