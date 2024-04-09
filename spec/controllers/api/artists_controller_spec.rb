require 'rails_helper'

RSpec.describe "Artists", type: :request do
  let(:artist) { FactoryBot.create(:artist) }

  context "GET /Index" do
    it "should render index page as JSON" do
      # Perform a GET request to the endpoint that returns JSON
      get artists_path, params: { format: :json }

      # Validate the response
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")

      # You can also add more specific JSON response validations here
      # For example, assuming your API returns a list of artists:
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_an_instance_of(Array)
      # Add more expectations as needed based on your JSON structure

      # Additional example if you're using a serializer or specific JSON structure:
      # expect(parsed_response[0]['name']).to eq(artist.name)

      # More validations can be added based on your specific API response structure

      # Or, using a custom matcher (e.g., rendering_json):
      # expect(response).to render_json
    end
  end
end
