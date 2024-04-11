class Album < ApplicationRecord
  belongs_to :artist
  validates :title, presence: true, length: { maximum: 1000 }
  validates :release_date, presence: true
end
