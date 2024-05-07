class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #destroy user
  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      render json: {message: "User deleted"}
    else
      render json: {error: "User not found"}, status: :not_found
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
