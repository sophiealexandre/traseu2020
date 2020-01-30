class AddCountryOfOriginToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :countryoforigin, :string
  end
end
