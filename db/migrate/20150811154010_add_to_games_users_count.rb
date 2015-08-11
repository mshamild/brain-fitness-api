class AddToGamesUsersCount < ActiveRecord::Migration
  def change
    add_column :games, :users_count, :integer, default: 0, null: false
  end
end
