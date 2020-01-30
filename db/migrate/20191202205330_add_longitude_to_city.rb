class AddLongitudeToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :longitude, :float
  end
end
