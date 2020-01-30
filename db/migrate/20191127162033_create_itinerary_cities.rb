class CreateItineraryCities < ActiveRecord::Migration[5.2]
  def change
    create_table :itinerary_cities do |t|
      t.references :itinerary, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
