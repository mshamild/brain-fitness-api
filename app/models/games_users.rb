class GamesUsers < ActiveRecord::Base
  belongs_to :user
  belongs_to :game, counter_cache: :users_count
end
