class AlbumsController < ApplicationController
  before_action :find_artist
  before_action :find_album, only: [:show, :update, :destroy]

  def index
    @albums = @artist.albums
    render json: @albums
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
      render json: @album, status: :created
    else
      render json: { errors: @album.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @album.update(album_params)
      render json: @album
    else
      render json: { errors: @album.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @album.destroy
    head :no_content
  end

  private
    def find_artist
      @artist = Artist.find(params[:artist_id])
    end

    def find_album
     @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, :release_date)
    end
end
