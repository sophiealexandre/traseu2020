class AddTitleToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :title, :string
  end
end
