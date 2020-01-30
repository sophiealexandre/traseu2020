class AddLatitudeToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :latitude, :float
  end
end
