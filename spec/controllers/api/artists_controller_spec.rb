require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  let(:artist) { FactoryBot.create(:artist) }
  describe "GET #index" do
    it "renders index page as JSON" do
      get :index, format: :json
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_an_instance_of(Array)
    end
  end

  describe "GET #show" do


    it "renders show page as JSON" do
      get :show, params: { id: artist.id }, format: :json
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_an_instance_of(Hash)
      expect(parsed_response["id"]).to eq(artist.id)
      expect(parsed_response["name"]).to eq(artist.name)
      expect(parsed_response["bio"]).to eq(artist.bio)
    end
  end

  describe "POST #create" do
    let(:valid_attributes) { FactoryBot.attributes_for(:artist) }

    it "creates a new artist" do
      expect {
        post :create, params: { artist: valid_attributes }, format: :json
      }.to change(Artist, :count).by(1)
      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["name"]).to eq(valid_attributes[:name])
      expect(parsed_response["bio"]).to eq(valid_attributes[:bio])
    end

    it "returns unprocessable entity if artist is not saved" do
      expect {
        post :create, params: { artist: { name: nil, bio: nil } }, format: :json
      }.to change(Artist, :count).by(0)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to have_key("name")
      expect(parsed_response).to have_key("bio")
    end
  end

  describe "PATCH #update" do
    let(:valid_attributes) { FactoryBot.attributes_for(:artist) }

    it "updates an artist" do
      patch :update, params: { id: artist.id, artist: valid_attributes }, format: :json
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["name"]).to eq(valid_attributes[:name])
      expect(parsed_response["bio"]).to eq(valid_attributes[:bio])
    end

    it "returns unprocessable entity if artist is not updated" do
      patch :update, params: { id: artist.id, artist: { name: nil, bio: nil } }, format: :json
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to have_key("name")
      expect(parsed_response).to have_key("bio")
    end
  end

  describe "DELETE #destroy" do
    it "deletes an artist" do
      delete :destroy, params: { id: artist.id }, format: :json
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["message"]).to eq("Artist deleted")
    end
  end

end
