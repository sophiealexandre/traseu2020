class CreateItinerarySpots < ActiveRecord::Migration[5.2]
  def change
    create_table :itinerary_spots do |t|
      t.integer :days
      t.references :spot, foreign_key: true
      t.references :itinerary, foreign_key: true

      t.timestamps
    end
  end
end
