class Artist < ApplicationRecord
  def index
    @artists = Artist.all
  end
end
