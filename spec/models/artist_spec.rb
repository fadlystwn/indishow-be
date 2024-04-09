require 'rails_helper'

RSpec.describe Artist, type: :model do
  let(:artist) { build(:artist) }

  it 'has a valid factory' do
    expect(artist).to be_valid
  end

  it 'is invalid without a name' do
    artist.name = nil
    expect(artist).to be_invalid
    expect(artist.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a genre' do
    artist.genre = nil
    expect(artist).to be_invalid
    expect(artist.errors[:genre]).to include("can't be blank")
  end

  it 'is invalid without a bio' do
    artist.bio = nil
    expect(artist).to be_invalid
    expect(artist.errors[:bio]).to include("can't be blank")
  end

  it 'is invalid with a bio less than 20 characters' do
    artist.bio = 'Short bio'
    expect(artist).to be_invalid
    expect(artist.errors[:bio]).to include("is too short (minimum is 20 characters)")
  end

  it 'has a name' do
    expect(artist.name).to eq('Nirvana')
  end

  it 'has a genre' do
    expect(artist.genre).to eq('Grunge')
  end

  it 'has a bio' do
    expect(artist.bio).to eq('Nirvana was an American rock band formed in 1987 in Aberdeen, Washington. Founded by lead singer and guitarist Kurt Cobain and bassist Krist Novoselic, the band went through a succession of drummers before recruiting Dave Grohl in 1990. Nirvana\'s success popularized alternative rock, and they were often referenced as the figurehead band of Generation X.')
  end
end
