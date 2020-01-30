class AddImageToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :image, :string
  end
end
