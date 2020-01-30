class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookmarks
  has_many :itinerary_cities, dependent: :destroy
  has_many :cities, through: :itinerary_cities
  has_many :itinerary_spots, dependent: :destroy
  has_many :spots, through: :itinerary_spots

  validates :country, presence: true
  validates :experience, presence: true
  validates :budget, presence: true
  validates :days, presence: true
end
