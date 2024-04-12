def index
  @users = User.all
  render json: @users
end
