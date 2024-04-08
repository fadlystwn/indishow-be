class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render json: @artists
  end
  def show
    @artist = Artist.find(params[:id])
    render json: @artist
  end
  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      render json: artist, status: :created
    else
      render json: {error: artist.errors.full_messages}, status: :unprocessable_entity
    end
  end
  private
  def artist_params
    params.require(:artist).permit(:name, :bio, :genre)
  end
end
