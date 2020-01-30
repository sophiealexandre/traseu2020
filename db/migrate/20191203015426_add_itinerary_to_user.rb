class AddItineraryToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :itineraryofuser, :string
  end
end
