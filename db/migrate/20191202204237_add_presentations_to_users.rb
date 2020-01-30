class AddPresentationsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :presentation, :text
  end
end
