module Api
  module V1
    class ArtistsController < ApplicationController
      # GET /artists
      def index
        @artists = Artist.all
        render json: @artists
      end

      # GET /artists/:id
      def show
        @artist = Artist.find(params[:id])
        render json: @artist
      end

      # POST /artists
      def create
        @artist = Artist.new(artist_params)

        if @artist.save
          render json: @artist, status: :created
        else
          render json: @artist.errors, status: :unprocessable_entity
        end
      end

      # PATCH /artists/:id

      def update
        @artist = Artist.find(params[:id])
        @artist_updated = @artist.update(artist_params)
        if @artist_updated
          render json: @artist
        else
          render json: @artist.errors, status: :unprocessable_entity
        end
      end

      # DELETE /artists/:id
      def destroy
        @artist = Artist.find(params[:id])
        @artist.destroy
        render json: { message: 'Artist deleted' }

      end

      private

      def artist_params
        params.require(:artist).permit(:name, :genre, :bio)
      end
    end

  end
end
