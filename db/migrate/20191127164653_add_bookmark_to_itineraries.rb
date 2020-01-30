class AddBookmarkToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :bookmark, :boolean, default: false
  end
end
