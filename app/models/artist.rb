class Artist < ApplicationRecord
  validates :name, presence: true
  validates :genre, presence: true
  validates :bio, presence: true, length: { minimum: 20}
end
