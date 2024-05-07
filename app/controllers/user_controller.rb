class UserController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  #edit user
  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
      render json: @user,status :created
    else
      render json: @user.errrors, status: :unprocessable_entity
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
