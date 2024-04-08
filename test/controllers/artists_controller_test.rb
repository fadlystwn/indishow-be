require "test_helper"

class ArtistsControllerTest < ActionDispatch::IntegrationTest
 describe "#POST create" do
 it "should create a new artist" do
  post :create, params: {artist: {name: "Nirvana", genre: "Grunge", bio: "A rock band from Seattle"}}
  expect(response).to_have_http_status(:created)
  expect(Artist.name).to eq("Nirvana")
  expect(Artist.genre).to eq("Grunge")
 end

 it 'does not create a new artist without a name' do
  post :create, params: {artist: {genre: "Grunge", bio: "A rock band from Seattle"}}
  expect(response).to_have_http_status(:unprocessable_entity)
  expect(Artist.count).to eq(0)
 end
end
