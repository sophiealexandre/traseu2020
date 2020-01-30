class ItinerarySpot < ApplicationRecord
  belongs_to :spot
  belongs_to :itinerary

  # validates :days, presence: true
end
