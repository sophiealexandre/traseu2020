class AddColumnsToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :description, :text
    add_column :cities, :image, :string
  end
end
