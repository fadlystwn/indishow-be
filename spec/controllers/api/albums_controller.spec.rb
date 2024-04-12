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
    let(:valid_params) { { album: { title: "New Album", release_date: "2022-01-01" } } }
    let(:invalid_params) { { album: { title: nil, release_date: nil } } }

    context "with valid params" do
      it "creates a new album" do
        expect {
          post :create, params: { artist_id: artist.id, album: valid_params }, format: :json
        }.to change(Album, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq("application/json; charset=utf-8")
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["title"]).to eq(valid_params[:album][:title])
        expect(parsed_response["release_date"]).to eq(valid_params[:album][:release_date])
      end
    end

    context "with invalid params" do
      it "returns unprocessable entity" do
        expect {
          post :create, params: { artist_id: artist.id, album: invalid_params }, format: :json
        }.not_to change(Album, :count)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to have_key("errors")
      end
    end
  end

  describe "PATCH #update" do
    let(:valid_params) { { album: { title: "Updated Album", release_date: "2023-01-01" } } }
    let(:invalid_params) { { album: { title: nil, release_date: nil } } }

    context "with valid params" do
      it "updates the album" do
        patch :update, params: { artist_id: artist.id, id: album.id, album: valid_params }, format: :json
        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq("application/json; charset=utf-8")
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["title"]).to eq(valid_params[:album][:title])
        expect(parsed_response["release_date"]).to eq(valid_params[:album][:release_date])
      end
    end

    context "with invalid params" do
      it "returns unprocessable entity" do
        patch :update, params: { artist_id: artist.id, id: album.id, album: invalid_params }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to have_key("errors")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the album" do
      expect {
        delete :destroy, params: { artist_id: artist.id, id: album.id }, format: :json
      }.to change(Album, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
