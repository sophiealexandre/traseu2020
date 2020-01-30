class City < ApplicationRecord
  has_many :itinerary_cities, dependent: :destroy
  has_many :spots, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
