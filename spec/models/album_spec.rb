require 'rails_helper'

RSpec.describe Album, type: :model do
  describe 'validations' do
    it 'validates the presence of title' do
      album = Album.new(title: nil)
      expect(album).not_to be_valid
      expect(album.errors[:title]).to include("can't be blank")
    end

    it 'validates the maximum length of title' do
      album = Album.new(title: 'a' * 1001)
      expect(album).not_to be_valid
      expect(album.errors[:title]).to include("is too long (maximum is 1000 characters)")
    end

    it 'validates the presence of release_date' do
      album = Album.new(release_date: nil)
      expect(album).not_to be_valid
      expect(album.errors[:release_date]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it 'belongs to an artist' do
      association = described_class.reflect_on_association(:artist)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
