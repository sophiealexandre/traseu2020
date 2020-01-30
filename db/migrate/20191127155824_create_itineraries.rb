class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.string :country
      t.string :experience
      t.integer :budget
      t.integer :days
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
