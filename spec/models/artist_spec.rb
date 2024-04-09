
require 'rails_helper'

RSpec.describe Artist, type: :model do
  # Set up a valid artist instance for testing
  let(:artist) { build(:artist) }

  # Test that the factory is valid
  it 'has a valid factory' do
    expect(artist).to be_valid
  end

  # Test that the name attribute is set correctly
  it 'has a name' do
    expect(artist.name).to eq('Nirvana')
  end

  # Test that the genre attribute is set correctly
  it 'has a genre' do
    expect(artist.genre).to eq('Grunge')
  end

  # Test that the bio attribute is set correctly
  it 'has a bio' do
    expect(artist.bio).to eq('Nirvana was an American rock band formed in 1987 in Aberdeen, Washington. Founded by lead singer and guitarist Kurt Cobain and bassist Krist Novoselic, the band went through a succession of drummers before recruiting Dave Grohl in 1990. Nirvana\'s success popularized alternative rock, and they were often referenced as the figurehead band of Generation X.')
  end
end
