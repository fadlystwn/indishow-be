require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let(:artist) { FactoryBot.create(:artist) }
  let(:album) { FactoryBot.create(:album, artist: artist) }

  describe "GET #index" do
    it "renders index page as JSON" do
      get :index, params: { artist_id: artist.id }, format: :json
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_an_instance_of(Array)
    end
  end

  describe "GET #show" do
    it "renders show page as JSON" do
      get :show, params: { artist_id: artist.id, id: album.id }, format: :json
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_an_instance_of(Hash)
      expect(parsed_response["id"]).to eq(album.id)
      expect(parsed_response["title"]).to eq(album.title)
      expect(parsed_response["release_date"]).to eq(album.release_date)
    end
  end

  describe "POST #create" do
    let(:valid_attributes) { FactoryBot.attributes_for(:album) }

    it "creates a new album" do
      expect {
        post :create, params: { artist_id: artist.id, album: valid_attributes }, format: :json
      }.to change(Album, :count).by(1)
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["title"]).to eq(valid_attributes[:title])
      expect(parsed_response["release_date"]).to eq(valid_attributes[:release_date])
    end

    it "returns unprocessable entity if album is not saved" do
      expect {
        post :create, params: { artist_id: artist.id, album: { title: nil, release_date: nil } }, format: :json
      }.to_not change(Album, :count)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to have_key("errors")
    end
  end

  describe "PATCH #update" do
    it "updates the album" do
      patch :update, params: { artist_id: artist.id, id: album.id, album: { title: "New Title" } }, format: :json
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["title"]).to eq("New Title")
    end

    it "returns unprocessable entity if album is not updated" do
      patch :update, params: { artist_id: artist.id, id: album.id, album: { title: nil } }, format: :json
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to have_key("errors")
    end
  end

  describe "DELETE #destroy" do
    it "destroys the album" do
      expect {
        delete :destroy, params: { artist_id: artist.id, id: album.id }, format: :json
      }.to change(Album, :count).by(-1)
      expect(response).to have_http_status(:success)
    end
  end
end
