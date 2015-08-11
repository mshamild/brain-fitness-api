class CreateGamesUsersHabtm < ActiveRecord::Migration
  def change
    create_table :games_users do |t|
      t.integer :game_id, index: true
      t.integer :user_id, index: true
    end
  end
end
