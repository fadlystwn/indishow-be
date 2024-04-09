require 'rails_helper'

RSpec.describe "Artists", type: :request do
  let(:artist) { FactoryBot.create(:artist) }

  context "GET /Index" do
    it "should render index page as JSON" do
      get artists_path, params: { format: :json }
      expect(response).to have_http_status(:success)

      expect(response.content_type).to eq("application/json; charset=utf-8")

      parsed_response = JSON.parse(response.body)

      expect(parsed_response).to be_an_instance_of(Array)

    end
  end

  context "GET /Show" do
    it "should render show page as JSON" do
      get artist_path(artist.id), params: { format: :json }
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_an_instance_of(Hash)

      expect(parsed_response["id"]).to eq(artist.id)
      expect(parsed_response["name"]).to eq(artist.name)
      expect(parsed_response["bio"]).to eq(artist.bio)
    end
  end
end
