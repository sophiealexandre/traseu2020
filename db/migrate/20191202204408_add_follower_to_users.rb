class AddFollowerToUsers < ActiveRecord::Migration[5.2]
  def change
     add_column :users, :follower, :integer
  end
end
