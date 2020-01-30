class Review < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user

  validates :rating, presence: true
end
