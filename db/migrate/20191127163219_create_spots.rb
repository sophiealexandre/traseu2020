class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :title
      t.string :address
      # t.string :city
      t.string :zip_code
      t.text :description
      t.integer :price
      t.references :city, foreign_key: true
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
