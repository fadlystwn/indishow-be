class AlbumsController < ApplicationController
  before_action :find_artist

  def index
    @album = @artist.albums
    render json: @album
  end

  def show
    @album = @artist.albums.find(params[:id])
    render json: @album
  end

  def new
    @album = @artist.albums.build
  end

  def create
    @album = @artist.albums.build(album_params)
    if @album.save
      render json: @album
    else
      render json: { errors: @album.errors }, status: :unprocessable_entity
    end
  end

  def update
    @album = @artist.albums.find(params[:id])
    @album_updated = @album.update(album_params)
    if @album_updated
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end
  def destroy
    @album = @artist.albums.find(params[:id])
    @album.destroy
  end
  private
    def find_artist
      @artist = Artist.find(params[:artist_id])
    end

    def album_params
      params.require(:album).permit(:title, :release_date)
    end
end
