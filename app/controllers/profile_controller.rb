class ProfileController < ApplicationController
  before_action :authenticate_user!
  #GET /profile
  def show
    @profile = User.find_by(params[:user_id])
    render json: @profile
  end
  def index
end
