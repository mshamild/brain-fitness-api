class AddUsersCountToGame < ActiveRecord::Migration
  def change
    add_column :games, :users_count, :integer, default: 0
  end
end
