class Game < ActiveRecord::Base
  ROUNDS_COUNT = 6

  has_many :rounds, inverse_of: :game
  has_and_belongs_to_many :users
end
